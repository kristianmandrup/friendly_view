class Search
  class Presenter < BasePresenter
    decorates :search

    include BootstrapPresenter    

    # search form
    # location input + list of selectors
    def inputs_line num
      send "line_#{num}"
    end

    def location_input
      search :location, t('properties.search.form.location.prompt')
    end

    def search_button form
      form.action :submit, :as => :button, label: t('search.form.button')
    end

    def slider_rooms
      ui_select_slider :html => {:id => 'rooms', :class => 'slider rooms'}, :ui => {:labels => 5}, :labels => (1..5).to_a, :range => [1,3]      
    end

    def slider_size
      ui_select_slider :html => {:id => 'size', :class => 'slider size'}, :ui => {:labels => 3}, :labels => (1..10).to_a.map{|v| v*10}, :range => [30,60]
    end

    protected

    safe_content :show_results do
      badge(search.results) + link_to('show results', '/properties')
    end

    safe_content :show_results do
      awesome_icon(:group) do
        link_to('show results', '/properties')
      end
    end

    safe_content :line_1 do
      selectors_for(1)
    end

    safe_content :line_2 do
      selectors_for(2)
    end

    # ui_select_slider :ui => {:labels => 7}, :labels => ['1', 2, 3], sliderOptions, :range => [1,3] do
    def selectors order
      order.map do |name|
        send("#{name}_selector")
      end
    end

    def selectors_for num
      selectors line_selectors(num)
    end

    def line_selectors num
      num == 1 ? selector_order[0..2] : selector_order[3..-1]
    end

    def selector_order
      self.class.selector_types
    end

    def self.selector_types
      [:type, :rooms, :period, :furnish, :size, :cost, :distance]
    end

    # def locale_selector form
    #   form.input :locale,         :as => :select, :collection => Locale.selection
    # end
    selector_types.each do |type|
      define_method "#{type}_selector" do
        form.input type, base_options.merge(as: :select, collection: Search.send("#{type}_select"), prompt: prompt_for(type))
      end
    end

    def prompt_for type
      t("properties.search.form.#{type}.prompt")
    end

    def base_options
      {label: false, input_html: {class: 'ui-widget'} }
    end

    def search name, placeholder
      form.input name, base_options.merge(as: :search, :input_html => {class: 'ui-widget', placeholder: placeholder})
    end
  end
end
