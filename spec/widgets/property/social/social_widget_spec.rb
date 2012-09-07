require 'spec_helper'

describe Property::SocialWidget do
  has_widgets do |root|
    root << widget('property/social')
  end
  
  it "should render :show" do
    render_widget('property/social', :show).should have_selector("h1")
  end
  
end
