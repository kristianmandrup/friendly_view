require 'spec_helper'

describe PropertyWidget do
  has_widgets do |root|
    root << widget('property')
  end
  
  it "should render :show" do
    render_widget('property', :show).should have_selector("h1")
  end
  
end
