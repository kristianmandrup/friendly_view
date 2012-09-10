class TopBar::FormWidget < Apotomo::Widget
  def show
    @search_decorator = Decorators.decorate(:search)
    render
  end
end
