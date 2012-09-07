require 'spec_helper'

describe Properties::MapWidget do
  has_widgets do |root|
    root << widget('properties/map')
  end
  
  it "should render :show" do
    render_widget('properties/map', :show).should have_selector("h1")
  end
  
end
