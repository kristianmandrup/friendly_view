class OauthDataExtractor
  attr_accessor :extractors

  def initialize service
    @service = service
  end

  def extract_from omniauth
    extractors.each do |extractor|
      return extractor.new(omniauth).extract if extractor.applies_to? service
    end
    nil # service_not_supported!    
  end

  def extractors
    @extractors ||= default_extractors
  end

  def register_extractor clazz
    extractors << clazz
  end

  def default_extractors
    [OauthDataExtractor::Facebook, OauthDataExtractor::Github, OauthDataExtractor::Standard]
  end

  def service_not_supported!
    raise %Q{Service #{service} is currently not supported by the OauthDataExtractor. 
Please register an extractor class with OauthDataExtractor#register_extractor}
  end

  class Base
    attr_accessor :auth_hash, :omniauth

    def initialize omniauth
      @omniauth = omniauth
    end

    def auth_hash
      @auth_hash ||= {email: '', name: '', uid: '', provider: ''}
    end

    def extract
      authhash[:provider] = omniauth['provider'] if omniauth['provider']
      user_data_fields.each do |field|
        authhash[field] = user_data_entry[field.to_s] if user_data_entry[field.to_s]
      end
      authhash 
    end

    protected

    def user_data_fields
      [:email, :name, :uid]
    end
  end

  class Facebook < Base
    def initialize omniauth
      super
    end

    def self.applies_to? service
      service == 'facebook'
    end

    def extract
      super
    end      

    protected

    def user_data_entry
      omniauth['extra']['user_hash']
    end    
  end

  class Github < Base
    def initialize omniauth
      super
    end

    def self.applies_to? service
      service == 'github'
    end

    def id_value
      omniauth['extra']['user_hash']['id']
    end

    def extract
      super
      authhash[:uid] = id_value if id_value
    end      

    protected

    def user_data_fields
      [:email, :name]
    end

    def user_data_entry
      omniauth['user_info']['user_hash']
    end    
  end

  class Standard < Base
    def initialize omniauth
      super
    end

    def self.applies_to? service
      services_supported.include?(service)
    end

    def extract
      super
      authhash[:uid] = id_value if id_value
    end      

    def services_supported
      %w{google yahoo twitter myopenid open_id'}
    end

    protected

    def id_value
      omniauth['uid']
    end

    def user_data_fields
      [:email, :name]
    end

    def user_data_entry
      omniauth['user_info']
    end
  end
end

