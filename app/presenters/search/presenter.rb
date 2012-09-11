class Search
  class Presenter < BasePresenter
    decorates :search

    include BootstrapPresenter      

    def location_input
      search :location, t('properties.search.form.location.prompt')
    end

    safe_content :show_results do
      badge(search.results) + link_to('show results', '/properties')
    end

    safe_content :create_agent do
      awesome_icon(:group) do
        link_to('crate agent', '/create_agent')
      end
    end

    def furnishment_selector
      @furnishment_selector ||= ButtonsetSelector.new :furnishment, search, form
    end

    def type_selector
      @type_selector ||= ButtonsetSelector.new :type, search, form
    end

    # with 2-3 rooms
    def rooms_selector
      @rooms_selector ||= SliderSelector.new :rooms, search, form
    end

    # and 100-200 m2
    def size_selector
      @size_selector ||= SliderSelector.new :size, search, form
    end

    # from 1.Oct/12 - 3.Apr/13
    def period_selector
      @period_selector ||= DateRangeSelector.new :period, search, form
    end

    def sort_selector
      selector :sort
    end

    protected    

    def base_options
      {label: false, input_html: {class: 'ui-widget'} }
    end

    def selector name
      form.input name, base_options.merge(as: :select, collection: Search.send("#{name}_select"), prompt: prompt_for(name))
    end    

    def search name, placeholder
      form.input name, base_options.merge(as: :search, :input_html => {class: 'ui-widget', placeholder: placeholder})
    end
  end
end
