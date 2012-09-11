class TopBar::FormWidget < Apotomo::Widget
  def show
    @search = session[:search] = Search.new
    @search_decorator = Decorators.decorator(:search).decorate(@search)    
    render view: 'show'
  end

  def search
    @search = session[:search]
    render text: "Widgets.topBar.form.search(#{@search.to_json});"
  end
end
