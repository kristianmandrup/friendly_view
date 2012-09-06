class User
  module Action
    class MailPresenter < Presenter
      def present
        user ? signed_in : signed_out
      end

      protected

      def mail_action
        badge_action :mail, mail_count
      end

      def favorites_count
        # user.mails.all.size
        user.mails.size
      end
    end
  end
end