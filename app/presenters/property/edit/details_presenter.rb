class Property
  module Edit
    class Details
      attr_accessor :form

      def present form
        @form = form
        capture_haml do
          haml_tag :div, class: 'location' do
            categories.each do |category|
              display_category category
            end
          end
        end
      end

      protected

      def display_category name
        capture_haml do
          haml_tag :div, class: "category #{name}" do
            form.input name, as: :check_boxes, collection: send(name)
          end
        end        
      end

      def categories
        [:climatization, :machinery, :display, :exterior, :interior, :special]
      end

      # TODO: load from YML file!

      def climatization
        ['air conditioning', 'heating', 'fire place']
      end

      def machinery
        ['fridge', 'freezer']
      end

      def exterior
        ['garden', 'patio']
      end

      def interior
        ['lift', 'terrace']
      end

      def special
        ['handicap friendly', 'patio']
      end      

      def rules
        ['males only', 'females only']
      end
    end
  end
end