require 'spec_helper'

describe Property::DataWidget do
  has_widgets do |root|
    root << widget('property/data')
  end
  
  it "should render :show" do
    render_widget('property/datum', :show).should have_selector("h1")
  end
  
end
