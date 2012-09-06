class Property
  class ManagePresenter < Presenter

    safe_content :manage do
      content_tag :div, class: 'property manage' do
        display_icon :edit, label: t('property.manage')
      end
    end

    protected

    def self.menu_items
      [:location, :basics, :cost, :period, :photos, :contact_info, :details, :description]
    end
  end
end