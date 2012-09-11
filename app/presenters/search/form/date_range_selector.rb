class Search
  module Form
    class DateRangeSelector < Selector
      def selector
        ui_daterange html: html_options, ui: ui_options
      end

      protected

      # rangeStartTitle: 'Start date',
      # rangeEndTitle: 'End date',
      # nextLinkText: 'Next',
      # prevLinkText: 'Prev',
      # doneButtonText: 'Done',
      # earliestDate: Date.parse('-15years'), //earliest date allowed 
      # latestDate: Date.parse('+15years'), //latest date allowed 
      # rangeSplitter: '-', //string to use between dates in single input
      # dateFormat: 'm/d/yy', // date formatting. Available formats: http://docs.jquery.com/UI/Datepicker/%24.datepicker.formatDate
      # closeOnSelect: true, //if a complete selection is made, close the menu
      # arrows: false,
      def ui_options
        {
          rangeStartTitle: start_date_text, rangeEndTitle: end_date_text, nextLinkText: next_text, prevLinkText: previous_text, doneButtonText: done_text,
          earliestDate: earliest_date, latestDate: latest_date, dateFormat: date_format
        }
      end

      [:start_date, :end_date, :next, :previous, :done].each do |name|
        define_method "#{name}_text" do
          i18n name
        end
      end

      [:period_back, :period_forward, :date_format].each do |name|
        define_method name do
          i18n name
        end
      end

      def latest_date         
        Date.parse("-#{period_forward}")
      end

      def earliest_date         
        Date.parse("-#{period_back}")
      end

      def html_options
        {id: name, class: "daterange hidden"}
      end
    end
  end
end