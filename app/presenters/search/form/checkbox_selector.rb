class Search
  module Form
    class CheckboxSelector < MultipleSelector
      protected

      def create_checkboxes hash
        hash.inject('') do |res,(key, label)|
           res << s check_box_tag(key), label_tag(key, label)            
        end
      end
    end
  end
end
