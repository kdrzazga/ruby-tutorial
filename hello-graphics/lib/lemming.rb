require_relative('enum')

class Lemming
	def initialize(x, y)
		@x = x
		@y = y
		@direction = Direction::RIGHT
		@path = 'res/lem.png'
	end
	
	def path
		@path
	end
end
