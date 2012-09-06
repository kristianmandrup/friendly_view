require 'spec_helper'

module ActiveMerchantHelper
  include ActiveMerchant::Billing
  # include ActiveMerchant::Assertions
  include ActiveMerchant::Utils
  # include ActiveMerchant::Fixtures

  def credit_card(number = '4242424242424242', options = {})
    defaults = {
      number: number,
      month: 9,
      year: Time.now.year + 1,
      first_name: 'Longbob',
      last_name: 'Longsen',
      verification_value: '123',
      type: 'visa'
    }.update(options)

    ActiveMerchant::Billing::CreditCard.new(defaults)
  end
  
  def check(options = {})
    defaults = {
      name: 'Jim Smith',
      routing_number: '244183602', 
      account_number: '15378535', 
      account_holder_type: 'personal', 
      account_type: 'checking', 
      number: '1'
    }.update(options)
    
    ActiveMerchant::Billing::Check.new(defaults)
  end
  
  def address(options = {})
    { 
      name:     'Jim Smith',
      address1: '1234 My Street',
      address2: 'Apt 1',
      company:  'Widgets Inc',
      city:     'Ottawa',
      state:    'ON',
      zip:      'K1C2N6',
      country:  'CA',
      phone:    '(555)555-5555',
      fax:      '(555)555-6666'
    }.update(options)
  end
  
  def all_fixtures
    @@fixtures ||= load_fixtures
  end
  
  def fixtures(key)
    data = all_fixtures[key] || raise(StandardError, "No fixture data was found for '#{key}'")
    
    data.dup
  end
      
  def load_fixtures
    file = File.exists?(LOCAL_CREDENTIALS) ? LOCAL_CREDENTIALS : DEFAULT_CREDENTIALS
    yaml_data = YAML.load(File.read(file))
    symbolize_keys(yaml_data)
  
    yaml_data
  end
  
  def symbolize_keys(hash)
    return unless hash.is_a?(Hash)
    
    hash.symbolize_keys!
    hash.each{|k,v| symbolize_keys(v)}
  end
end
