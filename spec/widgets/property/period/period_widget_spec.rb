require 'spec_helper'

describe Property::PeriodWidget do
  has_widgets do |root|
    root << widget('property/period')
  end
  
  it "should render :show" do
    render_widget('property/period', :show).should have_selector("h1")
  end
  
end
