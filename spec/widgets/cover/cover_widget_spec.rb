require 'spec_helper'

describe CoverWidget do
  has_widgets do |root|
    root << widget('cover')
  end
  
  it "should render :show" do
    render_widget('cover', :show).should have_selector("h1")
  end
  
end
