require_relative('enum')

class Lemming
	LEMMINGS_COUNT = 0
	
	def initialize(x, y)
		@x = x
		@y = y
		@direction = Direction::RIGHT
		@class = LemmingClass::WALKER
		@speed = 0.02
		@path = 'res/lem.png'
		Lemming::LEMMINGS_COUNT += 1
		@id = LEMMINGS_COUNT
	end
	
	def move
		case @class
			when LemmingClass::WALKER
				if @direction == Direction::RIGHT
					@x += @speed
				elsif @direction == Direction::LEFT
					@x -= @speed
				end
			when LemmingClass::BLOCKER
				@path = 'res/blocker.png'
				#puts "blocker"
			when LemmingClass::JUMPER
				puts "jumper"
			when LemmingClass::FLOATER
				puts "floater"
			else
			# Code to execute if variable does not match any of the above values
			end
					
	end
	
	def conditional_border_bounce(max_tile_x, blocker_lemmings)
		x = self.tile[0]
		
		blocker_lemmings.each do |blocker|
			if blocker.get_class == LemmingClass::BLOCKER and blocker.tile[0] == tile[0]
				@x -= 2*@speed
				@speed = -@speed
				break
			end
		end
		
		if x <0 or x > max_tile_x
			@speed = -@speed
		end		
	end
	
	def path
		@path
	end
	
	def position
		[@x, @y]
	end
	
	def tile
		[@x.floor, @y.floor]
	end
	
	def to_string
		"Lemming #{@id} #{@class} [#{@x.floor}, #{@y.floor}]"
	end
	
  def get_class()
	@class
  end

  def set_class(new_class)
    if valid_class?(new_class)
      @class = new_class
      update_path
    else
      puts "Invalid class: #{new_class}"
    end
  end

  def valid_class?(cl)
    [LemmingClass::WALKER, LemmingClass::BLOCKER, LemmingClass::JUMPER, LemmingClass::FLOATER].include?(cl)
  end

  def update_path
    case @class
    when LemmingClass::WALKER
      @path = 'res/lem.png'
    when LemmingClass::BLOCKER
      @path = 'res/blocker.png'
    #when LemmingClass::JUMPER
    #  @path = 'res/jumper.png'  # Assuming there's a path for jumper
    #when LemmingClass::FLOATER
    #  @path = 'res/floater.png'  # Assuming there's a path for floater
    end
  end
end
