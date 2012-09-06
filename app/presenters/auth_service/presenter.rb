class AuthService
  class Presenter < BasePresenter
    decorates :auth_service 

    def present
      link_to "/auth/#{service}", service_image
    end

    protected

    def service_name
      service.to_s.camelize
    end

    def service_image
      image_tag "#{service}_64.png", service_name, size: "64x64", alt: service_name
    end
  end
end