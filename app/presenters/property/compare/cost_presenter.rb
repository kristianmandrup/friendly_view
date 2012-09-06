class Property
  module Compare 
    class DistancePresenter < Presenter

      # fx other: 9000 / my: 6000 = 1.5, so the other is 50% more expensive
      # fx other: 6000 / my: 9000 = 0.67, so mine is 33% cheaper
      def present        
        comparison_bar label, size: percent, color: :green
      end

      protected

      def label
        "#{prefix}#{display_percent}% #{sign_label}"
      end

      def sign_label
        percent < 0 ? :cheaper : :expensive
      end

      def prefix
        percent > 100 ? '+' : ''
      end

      def percent
        @percent ||= (property.cost / other_property.cost) - 1
      end

      def display_percent
        percent = percent.abs
        percent > 100 ? 100 : percent
      end        
    end
  end
end