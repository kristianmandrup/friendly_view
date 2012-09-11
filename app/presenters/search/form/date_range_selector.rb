class Search
  module Form
    class DateRangeSelector < Selector
      def label
        "#{from} - #{to}"
      end

      def selector
        ui_daterange html: html_options, ui: ui_options
      end

      protected

      def labels
        I18n.t("search.form.selector.#{name}.labels")
      end

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
          rangeStartTitle: range_start_title, rangeEndTitle: range_end_title, nextLinkText: next_link_text, prevLinkText: prev_link_text, doneButtonText: done_button_text,
          earliestDate: earliest_date, latestDate: latest_date, dateFormat: date_format
        }
      end

      def range_start_title
        i18n :start_date
      end

      def range_end_title
        i18n :end_date
      end
      
      def next_link_text
        i18n :next
      end

      def prev_link_text
        i18n :previous
      end

      def done_button_text
        i18n :done_button
      end

      def latest_date         
        Date.parse("-#{period_forward}")
      end

      def earliest_date         
        Date.parse("-#{period_back}")
      end

      # fx '14 days'
      def period_back
        i18n :period_back
      end

      # fx '1year'
      def period_forward
        i18n :period_forward
      end

      def latest_date
        Date.parse('+1year')
      end

      def date_format
        i18n :date_format
      end

      def html_options
        {id: name, class: "daterange hidden"}
      end
    end
  end
end