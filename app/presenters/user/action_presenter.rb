class User
  class ActionPresenter < User::Presenter  
    def search_actions
      search_presenter.present
    end

    def mail_actions
      mail_presenter.present
    end

    protected

    [:search, :mail].each do |name|
      define_method "#{name.to_s.camelize}_presenter" do
        "User::Action::#{name.to_s.camelize}Presenter".constantize.decorate(self)        
      end
    end
  end
end