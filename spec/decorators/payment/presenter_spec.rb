require 'spec_helper'

describe Payment::Presenter do
  subject { Payment::Presenter.new payment }
  let(:payment) { Payment.new}

  describe '#decorate' do
    specify do
      subject.decorate(form).should match(/<img.*>/)
    end
  end
end
