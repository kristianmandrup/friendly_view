class Property
  module Rating
    class AveragePresenter < Property::Presenter
      def present
        capture_haml do
          column_block :ratings, :users, :average do
            rating_for property, text: label
            current_rating_of property
          end
        end
      end

      def label
        "#{t('rating.by_users')} #{property.ratings.size}"
      end
    end
  end
end