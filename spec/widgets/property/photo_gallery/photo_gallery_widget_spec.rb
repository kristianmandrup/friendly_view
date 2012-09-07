require 'spec_helper'

describe Property::PhotoGalleryWidget do
  has_widgets do |root|
    root << widget('property/photo_gallery')
  end
  
  it "should render :show" do
    render_widget('property/photo_gallery', :show).should have_selector("h1")
  end
  
end
