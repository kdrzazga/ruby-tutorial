class Bars
	attr_reader :bitmap, :y_position, :bitmap_height, :x_offset1, :x_offset2

	def initialize(bitmap, x_offset1, x_offset2)
		@bitmap = bitmap
		@y_position = 0
		@bitmap_height = 15
		@scroll_speed = 0.5
		@x_offset1 = x_offset1
		@x_offset2 = x_offset2
	end
	
	def move
		@y_position += @scroll_speed
		if @y_position >= @bitmap_height
			@y_position = 0
		end
	end
end
