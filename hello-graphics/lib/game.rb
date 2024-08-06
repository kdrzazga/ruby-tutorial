require_relative('lemming')

class Game
	def initialize()
		@lemming = Lemming.new(0, 1)
		@board = Board.new(64, 48) # 64 tiles wide, 48 tiles high
		@base = Gosu::Image.new("res/rail.png")
	end
	
	def base
		@base
	end
	
	def board
		@board
	end
	
	def lemming
		@lemming
	end
end
