require_relative('lemming')

class Game
	attr_accessor :board, :lemming

	def initialize()
		@lemmings = [Lemming.new(0, 8), Lemming.new(2, 8), Lemming.new(4, 8), Lemming.new(7, 8), Lemming.new(9, 8), Lemming.new(11, 8)]
		@board = Board.new(64, 48) # 64 tiles wide, 48 tiles high
		@base = Gosu::Image.new("res/rail.png")
	end
	
	def step
		result_string = ""
		@lemmings.each do |lemming|
			lemming.move
			result_string << lemming.to_string + "\t"
			blocker_lemmings = @lemmings.select { |l| l.class == LemmingClass::BLOCKER || l != lemming }
			lemming.conditional_border_bounce(11, blocker_lemmings)
		end
		#puts result_string
	end
	
	def get_stats
		blocker_count = @lemmings.count { |lemming| lemming.get_class == LemmingClass::BLOCKER }
		walker_count = @lemmings.count { |lemming| lemming.get_class == LemmingClass::WALKER }

		[@lemmings.count, walker_count, blocker_count]
	end
	
	def base
		@base
	end
	
	def board
		@board
	end
	
	def lemmings
		@lemmings
	end
end
