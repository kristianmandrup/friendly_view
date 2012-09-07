class TopBarWidget < Apotomo::Widget
  has_widgets do |root|
    # root << widget(:form)
  end

  def display
    @search = Search.new
    @search_decorator = Decorators.decorator(:search).decorate(@search)

    options_with_indifferent_access = {map_options: {provider: :google}}.with_indifferent_access
    view_helper = Gmaps4rails::ViewHelper.new(options_with_indifferent_access)  
    @js_dependencies = Gmaps4rails.escape_js_url ? view_helper.js_dependencies_array : view_helper.js_dependencies_array.map(&:html_safe)
    
    render
  end
end
