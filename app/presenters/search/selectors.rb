class Search
  class Presenter < BasePresenter
    module Selectors
      # search form
      # location input + list of selectors
      def inputs_line num
        send "line_#{num}"
      end
  
      protected      

      safe_content :line_1 do
        selectors_for(1)
      end

      safe_content :line_2 do
        selectors_for(2)
      end

      # ui_select_slider :ui => {:labels => 7}, :labels => ['1', 2, 3], sliderOptions, :range => [1,3] do
      def selectors order
        order.map do |name|
          send("#{name}_selector")
        end
      end

      def selectors_for num
        selectors line_selectors(num)
      end

      def line_selectors num
        num == 1 ? selector_order[0..2] : selector_order[3..-1]
      end

      def selector_order
        self.class.selector_types
      end

      def self.selector_types
        [:furnish, :type, :rooms, :size, :cost, :period]
      end

      # def locale_selector form
      #   form.input :locale,         :as => :select, :collection => Locale.selection
      # end
      selector_types.each do |type|
        define_method "#{type}_selector" do
          selector name
        end
      end

      def prompt_for type
        t("properties.search.form.#{type}.prompt")
      end
    end
  end
end