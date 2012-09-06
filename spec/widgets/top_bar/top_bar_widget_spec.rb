require 'spec_helper'

describe TopBarWidget do
  has_widgets do |root|
    root << widget('top_bar')
  end
  
  it "should render :display" do
    render_widget('top_bar', :display).should have_selector("h1")
  end
  
end
