class Search
  module Form
    class Selector
      include ContentHelper

      attr_reader :name, :search, :form, :options

      def initialize name, search, form, options = {}
        @name = name
        @search = search
        @form = form
        @options = options
      end

      def display
        s label, selector, checkbox_any
      end      

      def label
        @label ||= begin
          s = "" 
          s << prefix if prefix
          s << "#{from} #{separator} #{to} #{unit}"
          s << postfix
          s
        end
      end

      def selector
        raise NotImplementedError, "Must be implemented by subclass"
      end

      def checkbox_any
        form.input "#{name}_any", as: :checkboxes, collection: ['any']
      end

      protected

      [:unit, :labels].each do |name|
        define_method name do
          i18n name
        end
      end

      [:postfix, :prefix].each do |name|
        define_method name do
          i18n(name)
        rescue
          nil
        end
      end

      def separator
        !i18n(:separator).blank? ? i18n(:separator) : '-'
      end


      def i18n
        I18n.t("search.form.selector.#{path}"
      end      
    end
  end
end