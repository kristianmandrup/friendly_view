class Search
  module Form
    class MultipleSelector < Selector
      def label
        selected.humanize_join(splitter)
      end

      protected

      def selected
        raise NotImplementedError, "must be implemented by sublclass"
      end

      def labels
        i18n :labels
      end

      def splitter
        I18n.t(:or) || 'or'
      rescue
        'or'
      end
    end
  end
end
