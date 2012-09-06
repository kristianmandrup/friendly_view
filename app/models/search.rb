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
      ['1 week', '2 weeks', '1 month', '2 months']
    end

    def size_select
      ['10 m2', '20 m2', '30 m2']
    end

    def cost_select
      ['1000', '2000', '3000', '4000']
    end

    def distance_select
      ['1 km', '2 km', '5 km', '10 km']
    end
  end
end