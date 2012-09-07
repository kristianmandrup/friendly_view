require 'spec_helper'

describe Cover::SlidingAdsWidget do
  has_widgets do |root|
    root << widget('cover/sliding_ads')
  end
  
  it "should render :show" do
    render_widget('cover/sliding_ad', :show).should have_selector("h1")
  end
  
end
