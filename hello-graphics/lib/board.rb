require_relative 'constants'
require_relative 'graph'

class Board
  
  def initialize(width, height)
    @width = width
    @height = height
	@tile_x = 0
	@tile_y = 0
  end
  
  def draw
	update
  end

  def update
  #  (0...@width - 2).each do |x| 
  #    (0...@height - 2).each do |y|
  #      Gosu.draw_rect(x * Constants::TILE_SIZE + 1, y * Constants::TILE_SIZE + 1, Constants::TILE_SIZE - 1, Constants::TILE_SIZE - 1, Gosu::Color::BLACK)
  #    end
  #  end
	draw_hollow_rect(@tile_x * Constants::TILE_SIZE + 1, @tile_y * Constants::TILE_SIZE + 1, Constants::TILE_SIZE - 1, Constants::TILE_SIZE - 1, Gosu::Color::YELLOW)
  end

  def tile_at(x, y)
    tile_x = (x / Constants::TILE_SIZE).floor()
    tile_y = (y / Constants::TILE_SIZE).floor()

	@tile_x = tile_x
	@tile_y = tile_y
	
    [tile_x, tile_y]
  end
  
  def screen_pos(board_x, board_y)
	x = board_x * Constants::TILE_SIZE
	y = board_y * Constants::TILE_SIZE
	
	[x, y]
  end
  
  def size
	[@width, @height]
  end
end
