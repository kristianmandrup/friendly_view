class Properties < Partializer
  class Show < Partializer
    partializer :costs do
      partialize :monthly_rent, :cost_details
    end

    partializer :lower do
      partializer :communication do
        partialize :profile, :contact_requests, :social, :favorite, :priority_subscription, :free_subscription, :comments
      end

      partialize :_communication, :description
    end

    partials_for :main, [{upper: :gallery}, :lower]

    partials_for :side, [:basic_info, :_costs, :more_info, :period, :similar_properties]
  end
end
