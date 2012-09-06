class Property
  class RatingPresenter < Presenter

    [:your, :average, :list].each do |name|
      define_method "present_#{name}" do
        "Property::Rating::#{name.to_s.camelize}Presenter".new(property).present
      end
    end
  end
end