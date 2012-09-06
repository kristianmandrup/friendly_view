class Property
  module Compare 
    class Presenter < Property::Presenter

      def comparison_bar label, options = {}
        size = options[:size] || 0
        color = options[:color] || :green
        haml_tag :div, class: "bar #{color}", style: "width: #{size}"
        haml_tag :div, label, class: 'label'
      end
    end
  end
end