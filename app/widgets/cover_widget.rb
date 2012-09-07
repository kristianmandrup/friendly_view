class CoverWidget < Apotomo::Widget
  has_widgets do |root|
    root << widget('cover/sliding_ads', :sliding_ads)
    root << widget(:top_bar)
    root << widget('properties/featured', :featured_properties)
  end

  def show
    render
  end
end
