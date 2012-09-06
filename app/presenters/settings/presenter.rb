class Settings
  class Presenter < BasePresenter
    decorates :settings

    def display_preference_selectors
      [currency_selector, locale_selector].join
    end

    protected

    def self.selector_types
      [:currency, :locale]
    end

    selector_types.each do |type|
      define_method "#{type}_selector" do |form|
        form.input type, as: :select, collection: Settings.send(type.to_s.plurazlize), prompt: t("properties.search.form.selector.#{type}.prompt")
      end
    end    
  end
end