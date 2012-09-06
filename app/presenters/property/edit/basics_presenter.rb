class Property
  module Edit
    class BasicsPresenter < Presenter
      def present
        capture_haml do
          haml_tag :div, class: 'details' do
            Property::Edit::DetailsPresenter.input_types
          end
        end
      end

      protected

      def self.input_types
        [:title] + slider_types
      end

      def self.slider_types
        [:type, :rooms, :bedrooms, :bathrooms, :furnishment, :floor, :size]
      end

      def slider name
        haml_tag :div, class: "slider #{name}"
      end

      def title form
        form.input :title, label: t('property.title')
      end

      slider_types.each do |name|
        define_method name do
          slider name
        end
      end
    end
  end
end