require 'spec_helper'

describe Property::CostWidget do
  has_widgets do |root|
    root << widget('property/cost')
  end
  
  it "should render :show" do
    render_widget('property/cost', :show).should have_selector("h1")
  end
  
end
