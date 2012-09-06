require 'payment_gateways/active_merchant_spec_helper'

shared_examples 'a danish card purchase' do
  specify { subject.params['currency'].should == 'DKK' }
  specify { subject.should be_success }
end

describe ActiveMerchant::Billing::QuickpayGateway do
  include ActiveMerchantHelper

  let(:gateway_class)     { ActiveMerchant::Billing::QuickpayGateway }
  let(:payment_provider)  { MainApp.config.payment_provider }

  let(:gateway) { gateway_class.new(payment_provider.development) }

  let(:amount)  { 100 }
  let(:cards)   { payment_provider.cards }

  let(:cards_without_verification) { 
    payment_provider.cards_without_verification 
  }

  let(:options) do
    { order_id: generate_unique_id[0...10], billing_address: address }    
  end
  
  def card name
    credit_card cards.dankort, card_opts(name)
  end

  def card_opts name
    cards_without_verification.include?(name.to_s) ? {verification_value: nil} : {}
  end

  describe 'should make successful purchase' do
    subject do
      gateway.purchase amount, card(:visa), options
    end
    
    it_behaves_like 'a danish card purchase'
  end

  describe 'successful_dankort_authorization' do
    #<ActiveMerchant::Billing::Response:0x007fd3dfc301f8 
    # @params={"msgtype"=>"authorize", "ordernumber"=>"2408e3f67b", "amount"=>"100", "currency"=>"DKK", "time"=>"120425000107", 
    # "state"=>nil, "qpstat"=>"008", "qpstatmsg"=>"Invalid merchant id", "chstat"=>nil, "chstatmsg"=>nil, "merchant"=>nil, "merchantemail"=>nil, "transaction"=>nil, 
    # "cardtype"=>"Dankort", "cardnumber"=>nil, "cardexpire"=>nil, "splitpayment"=>nil}, @message="Invalid merchant id", @success=false, @test=false, @authorization=nil,
    # @fraud_review=nil, @avs_result={"code"=>nil, "message"=>nil, "street_match"=>nil, "postal_match"=>nil}, @cvv_result={"code"=>nil, "message"=>nil}>

    subject do
      res = gateway.authorize amount, card(:dankort), options
      puts res.inspect
      res
    end

    it_behaves_like 'a danish card purchase'
    specify { subject.params['cardtype'].downcase.should == 'dankort' }
  end
  
  def test_successful_visa_dankort_authorization
    subject do
      gateway.authorize amount, card(:visa_dankort), options
    end

    it_behaves_like 'a danish card purchase'

    specify { subject.params['cardtype'].should == 'visa-dk' }
  end  
end  
