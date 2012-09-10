require 'spec_helper'

describe Property::MenuWidget do
  has_widgets do |root|
    root << widget('property/menu')
  end
  
  it "should render :show" do
    render_widget('property/menu', :show).should have_selector("h1")
  end
  
end
