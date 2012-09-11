class Search
  module Form
    class ButtonsetSelector < MultipleSelector
      def selector id, checkbox_hash = {}
        content_tag :div, id: id do
          create_checkboxes checkbox_hash
        end
      end

      def js_enable
        "$('.checkboxes' ).buttonset();"
      end
    end
  end
end
