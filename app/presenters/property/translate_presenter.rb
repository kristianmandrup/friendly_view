class Property
  class TranslatePresenter < Presenter
    def language_selector form
      form.input type, as: :select, collection: Selector.locale, prompt: t('language.choose')
    end
  end
end