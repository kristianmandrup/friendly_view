class AuthService
  class UserDataPresenter < Presenter
    def present
      raw(data_list.join('<br/>') + content_tag(:span, service_state)).html_safe
    end

    protected

    def service_state
      service_logged_in? ? signed_in : remove_service      
    end

    def service_signed_in?
      session[:service_id] == service.id
    end

    def signed_in
      "Signed in"
    end

    def remove_service
      link_to "Remove this service", service, :confirm => 'Are you sure you want to remove this authentication?', :method => :delete, :class => "remove"
    end

    def service_name
      "#{service.provider_name}: #{service.uid_name}"
    end

    def data_list
      list = []
      list << service_name
      list << service.uname if service.uname != ''
      list << service.uemail if service.uemail != ''
    end
  end
end
