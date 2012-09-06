class Property
  module Rating
    class YourPresenter < Property::Presenter
      def present
        capture_haml do
          column_block :ratings do
            rating_for property, text: t('rating.rate_it')
            current_rating_of property
          end
        end
      end
    end
  end
end