class Property
  class SocialPresenter < Presenter
    def likes_bar
      capture_haml do
        column_block :likes do
          buttons :facebook_likes, :tweet, :rss_feed
        end
      end
    end
  end
end