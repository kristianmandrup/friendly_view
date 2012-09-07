require 'spec_helper'

describe Property::LocationWidget do
  has_widgets do |root|
    root << widget('property/location')
  end
  
  it "should render :show" do
    render_widget('property/location', :show).should have_selector("h1")
  end
  
end
