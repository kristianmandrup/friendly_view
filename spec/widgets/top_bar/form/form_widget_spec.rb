require 'spec_helper'

describe TopBar::FormWidget do
  has_widgets do |root|
    root << widget('top_bar/form')
  end
  
  it "should render :display" do
    render_widget('top_bar/form', :display).should have_selector("h1")
  end    
end
