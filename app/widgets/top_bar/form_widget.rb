class TopBar::FormWidget < Apotomo::Widget

  def display
    render
  end

  def my_gmaps_libs(options)
    puts "options: #{options}"
    options_with_indifferent_access = options.with_indifferent_access
    view_helper                     = Gmaps4rails::ViewHelper.new(options_with_indifferent_access)
    
    js_dependencies = if Gmaps4rails.escape_js_url
                        view_helper.js_dependencies_array
                      else
                        view_helper.js_dependencies_array.map(&:html_safe)
                      end

    render 'gmaps4rails/gmaps4rails_libs', 
           :locals  => { 
             :js_dependencies => js_dependencies
            }
  end

end
