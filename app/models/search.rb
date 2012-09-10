class Search
  include Mongoid::Document

  attr_accessor :location, :type, :rooms, :period, :furnish, :size, :cost, :distance

  class << self

    def type_select
      %w{house flat}
    end

    def rooms_select
      %w{1 2 3}
    end

    def period_select
      ['1 week', '2 weeks', '1 month', '2 months']
    end

    def furnish_select
      ['furnished', 'non-furnished']
    end

    def size_select
      ['10-20', '21-40', '40-60', '61-90', '91-130', '131-180', '181-250', '250+']
    end

    def cost_select
      ['0-1000', '1001-2000', '2001-3000', '3001-5000', '5001-8000', '8001-12000', '12001-20000', '20000+']
    end

    def distance_select
      ['1 km', '2 km', '5 km', '10 km']
    end
  end
end