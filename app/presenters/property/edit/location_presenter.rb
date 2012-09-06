class Property
  module Edit
    class LocationPresenter < Presenter
      def present
        capture_haml do
          haml_tag :div, class: 'location' do
            location_bar
            location_map
          end
        end
      end

      protected

      def location_bar
        
      end

      def location_map
        
      end
    end
  end
end