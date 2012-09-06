class Property
  class DetailsPresenter < Presenter
    def period
      display_item :period, property.period
    end

    def data
      Property::DetailsPresenter.data_items.each do |item|
        send item
      end
    end

    def more_details
      display_item :more_details, t('more_details')
    end

    def self.data_items
      [:size, :rooms, :bedrooms, :floor]
    end

    protected

    def display_icon_for type, value = nil
    end

    def display_item type, value, options = {}
      capture_haml do
        display_icon_for type, options[:icon]
        haml_tag :span, property.price
      end
    end

    Property::DetailsPresenter.data_items.each do |item|
      define_method item do
        display_item item, property.send(item)
      end
    end
  end
end