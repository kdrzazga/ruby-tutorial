require_relative('enum')

class Lemming
	def initialize(x, y)
		@x = x
		@y = y
		@direction = Direction.RIGHT
	end
end
