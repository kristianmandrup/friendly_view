class User
  module Action
    class SearchPresenter < Presenter
      def present
        capture_haml do
          [agents_action, favorites_action].join
        end
      end

      protected

      def agents_action
        badge_action :agents, agents_count
      end

      def favorites_action
        badge_action :star, favorites_count
      end

      def favorites_count
        user.favorites.size
      end

      def agents_count
        user.agents.size
      end
    end
  end
end