class Search
  module Form
    class Selector
      def initialize search, settings
        @search = search
        @settings = settings
      end

      def label
        "#{from} - #{to} #{unit}"
      end

      def selector
        raise NotImplementedError, "Must be implemented by subclass"
      end

      def checkbox_any
        form.input name, as: :checkboxes, collection: i18n(:any)
      end

      protected

      def unit
        i18n :unit
      end

      def labels
        i18n :labels
      end

      def i18n
        I18n.t("search.form.selector.#{path}"
      end      
    end
  end
end