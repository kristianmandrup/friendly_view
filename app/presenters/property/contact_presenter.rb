class Property
  class ContactPresenter < Presenter

    def stats
      capture_haml do
        haml_tag :div, 'canvas piechart here!'
      end
    end

    def photo
      capture_haml do
        haml_tag :div, class: 'img' do
          display_image profile.image
        end

        haml_tag :div, class: 'name' do
          display_image profile.name
        end
      end
    end

    def priority_subscription
      capture_haml do
        display_button :info
        display_content t('contact.priority_subscription.info')
        display_button :action, t('contact.priority_subscription.invite_friends')
      end
    end
  end
end