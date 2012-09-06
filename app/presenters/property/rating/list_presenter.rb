class Property
  module Rating
    class ListPresenter < Property::Presenter
      def present
        capture_haml do    
          column_block :user, :ratings do
            property.ratings.each do |rating|
              user_rating rating
            end
          end
        end
      end   

      protected 

      def user_rating rating
        haml_tag :div, t('rating.user_comments')
        haml_tag :div, class: 'user rating' do
          display_photo rating.user
          rating_for property, disabled: true
          display_content rating.comment
          expander title: t('ratings.more')
        end
      end      
    end
  end
end