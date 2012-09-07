require 'spec_helper'

describe Properties::FeaturedWidget do
  has_widgets do |root|
    root << widget('properties/featured')
  end
  
  it "should render :show" do
    render_widget('properties/featured', :show).should have_selector("h1")
  end
  
end
