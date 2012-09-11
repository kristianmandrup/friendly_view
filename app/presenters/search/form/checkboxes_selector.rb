class Search
  module Form
    class CheckboxesSelector < MultipleSelector
      def selector checkbox_hash = {}
        s create_checkboxes checkbox_hash
      end

      def js_enable
        "$('form input').filter(:checkbox, :radio).checkbox();"        
      end
    end
  end
end
