require 'spec_helper'

describe Property::DescriptionWidget do
  has_widgets do |root|
    root << widget('property/description')
  end
  
  it "should render :show" do
    render_widget('property/description', :show).should have_selector("h1")
  end
  
end
