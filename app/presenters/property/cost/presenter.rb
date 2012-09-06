class Property
  module Cost
    class Presenter
      def display category, cost
        display_cost property.send(category).send(cost)
      end
    end
  end
end