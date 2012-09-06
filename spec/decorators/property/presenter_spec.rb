require 'spec_helper'

describe Property::Presenter do
  subject { Property::Presenter.new property }
  let(:property) { Property.new}

  describe '#img' do
    specify do
      subject.img.should match(/<img.*>/)
    end
  end
end
