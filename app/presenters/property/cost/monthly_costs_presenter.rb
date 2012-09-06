class Property
  module Cost
    class MonthlyCosts < Presenter
      [:rent, :utilities, :media].each do |type|
        define_method type do
          send :display, type
        end
      end

      protected

      def display cost
        super :one_time_costs, cost
      end      
    end
  end
end