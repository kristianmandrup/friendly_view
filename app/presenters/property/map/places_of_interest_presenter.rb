# see http://stackoverflow.com/questions/10488855/haml-tag-outputs-directly-to-the-haml-template
class Property
  module Map
    class PlacesOfInterestPresenter < Property::Presenter

      def initialize property
        @property = property
      end

      def present
        places_of_interest
      end

      protected
      # display places of interest
      def places_of_interest
        capture_haml do
          haml_tag :div, class: 'poi' do
            expander
            bar
          end
        end
      end

      def expander
        haml_tag :div, t('poi.label'), class: 'expander'
      end

      def bar
        capture_haml do
          haml_tag :div, class: 'bar' do
            # iterate POI categories and display each
            PlacesOfInterest.types.each do |type|
              place_of_interest type
            end
          end
        end
      end    

      def place_of_interest type
        haml_tag :span, t("poi.#{type}"), class: 'poi'
      end
    end
  end
end