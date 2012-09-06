class User
  module Action
    class Presenter < User::Presenter
      include BootstrapPresenter

      protected
      
      def badge_action name, number
        action name, badge(number)
      end

      def action name, options = {}
        content = options[:content]
        size = options[:size]
        size_cls = 'icons-large' if size == :large
        clazz = "icon-#{name} #{size_cls}"
        haml_tag :li do
          haml_tag(:i, class: clazz) + content
        end
      end
    end
  end
end