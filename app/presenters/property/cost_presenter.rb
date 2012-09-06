class Property
  class CostPresenter < Presenter
    def cost
      display_item :cost, property.total_cost, icon: current_user.settings.currency
    end

    def display_monthly_costs
      monthly_costs.display_all
    end

    def display_one_time_costs
      one_time_costs.display_all
    end

    def display_entrance_costs
      display_cost property.total_cost
    end

    protected

    def monthly_costs
      MonthlyCostsPresenter.new property
    end

    def one_time_costs
      OneTimeCostsPresenter.new property
    end
  end
end