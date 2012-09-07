require 'spec_helper'

describe Properties::SimilarWidget do
  has_widgets do |root|
    root << widget('properties/similar')
  end
  
  it "should render :show" do
    render_widget('properties/similar', :show).should have_selector("h1")
  end
  
end
