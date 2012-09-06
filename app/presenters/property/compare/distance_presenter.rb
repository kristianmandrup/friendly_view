class Property
  module Compare 
    class DistancePresenter < Presenter

      def present
        comparison_bar label, size: size, color: :blue      
      end

      protected

      def label
        "#{display_distance}#{unit} #{t('away')}"
      end

      def size
        distance_in_kms * 10
      end

      def display_distance
        distance_in_kms > 10 ? 10 : distance_in_kms
      end

      def distance_in_kms
        distance_in_meters / 1000.0
      end

      def distance_in_meters
        from = geofactory.point(*property.location)
        to = geofactory.point(*other_property.location)
        from.distance(to) 
      end      

      def geofactory
        RGeo::Geographic.spherical_factory
      end
    end
  end
end