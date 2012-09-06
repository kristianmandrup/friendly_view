class TimeConverter
	class TimeUnitError < StandardError; end

	attr_accessor :number, :time_unit

	def initialize number, time_unit = :days
		@number = number
		@time_unit = time_unit
	end

  def time_unit= time_unit  	
    raise ArgumentError, "Illegal value: #{time_unit}" unless Enum.time_units.allow?(time_unit.downcase!)
    super unit
  end

	def set_dates
		return unless number && time_unit && number > 0
		self.end_date = start_date + (number).send(time_unit).from_now		
	end
end