class AuthService
  class UsedServicePresenter < Presenter
    def present
      known_provider? ? provider_img : openid_img
    end

    protected

    def provider_img
      image_tag "#{service.provider}_64.png", :size => "64x64"
    end

    def openid_img
      image_tag "openid_64.png", :size => "64x64"
    end

    def known_provider?
      providers.include? service.provider
    end

    def providers
      %w{aol facebook github google openid twitter yahoo}
    end
  end
end