class Property
  class EditPresenter < Presenter

    def present
      capture_haml do
        haml_tag :div, class: 'property edit' do
          display_icon :edit, label: t('property.edit')
        end
      end
    end

    protected
  end
end