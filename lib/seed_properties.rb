class SeedProperties
	attr_accessor :room_share, :room1, :rooms2 :rooms3, :rooms4, :many_rooms, :house, :house_boat

	def initialize yml
		@room_share	= yml.room_share
		@room1			= yml.room1
		@room2			= yml.room2
		@room3			= yml.room3
		@room4			= yml.room4
		@many_rooms	= yml.many_rooms
		@house 			= yml.house
		@house_boat = yml.house_boat
	end

	def next_type
		@room_share -= 1 and return :room_share if (room_share > 0)
		@room1 -= 1 and return :room1 if (room1 > 0)
		@room2 -= 1 and return :room2 if (room2 > 0)
		@room3 -= 1 and return :room3 if (room3 > 0)		
		@room4 -= 1 and return :room4 if (room4 > 0)
		@many_rooms -= 1 and return :many_rooms if (many_rooms > 0)
		@house -= 1 and return :house if (house > 0)
		@house_boat -= 1 and return :house_boat if (house_boat > 0)

		:room2 # default
	end
end
