module Selector
  class << self
    def locale
      {dk: 'Danish', en: 'English', es: 'Spanish'}
    end
    alias_method :language, :locale
    
    def currency
      {eur: 'Euro', usd: 'US Dollar', gbp: 'British Pound'}
    end

    def location
      {cph: 'Copenhagen', sth: 'Stockholm', mal: 'Malmö'}
    end

    def property_type
      {room: 'Room', apartment: 'Apartment', house: 'House'}
    end

    def room
    end

    def period
    end
  end
end