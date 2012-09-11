class Search
  module Form
    class SliderSelector < Selector
      def label
        "#{prefix} #{from} - #{to} #{unit}"
      end

      def selector
        ui_select_slider html: html_options, ui: ui_options, 
      end

      protected

      def from
        search.send(name).from
      end

      def to
        search.send(name).to
      end

      def range
        [from, to]
      end      

      def options
        {labels: labels, range: range}
      end

      def labels
        I18n.t("search.form.selector.#{name}.labels")
      end

      def ui_options
        {hideSelect: true}
      end

      def html_options
        {id: name, class: "slider hidden"}
      end
    end
  end
end