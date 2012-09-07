require 'spec_helper'

describe Properties::ListWidget do
  has_widgets do |root|
    root << widget('properties/list')
  end
  
  it "should render :show" do
    render_widget('properties/list', :show).should have_selector("h1")
  end
  
end
