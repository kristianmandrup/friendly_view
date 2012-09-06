class Property
  class ComparePresenter < Presenter
    def present
      capture_haml do
        haml_tag :div, class: 'compare' do
          compare_cost_presenter.present
          compare_distance_presenter.present
        end
      end
    end

    protected

    def compare_cost_presenter
      @cost_presenter ||= Property::Compare::CostPresenter.new(property)
    end

    def compare_distance_presenter
      @distance_presenter ||= Property::Compare::DistancePresenter.new(property).present
    end
  end
end
