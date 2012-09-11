class Search
  module Form
    class ResidenceTypeSelector < CheckboxesSelector

      def selected
        search.type.selected
      end
    end
  end
end