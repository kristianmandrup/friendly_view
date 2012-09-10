class TopBarWidget < Apotomo::Widget
  has_widgets do |root|
    # root << widget(:form)
  end

  def show
    @search = Search.new
    @search_decorator = Decorators.decorator(:search).decorate(@search)    
    render view: 'show'
  end
end
