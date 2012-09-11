class TopBarWidget < Apotomo::Widget
  has_widgets do |root|
    root << widget(:form)
  end

  def show
    render view: 'show'
  end
end
