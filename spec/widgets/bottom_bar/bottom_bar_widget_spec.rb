require 'spec_helper'

describe BottomBarWidget do
  has_widgets do |root|
    root << widget('bottom_bar')
  end
  
  it "should render :show" do
    render_widget('bottom_bar', :show).should have_selector("h1")
  end
  
end
