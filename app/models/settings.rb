class Settings
  include Mongoid::Document

  attr_accessor :locale, :currency

  class << self
    def locales
      %w{danish spanish}
    end

    def currencies
      %w{euro kroner}
    end
  end
end