require_relative 'graph'

class Board
  TILE_SIZE = 50 
  
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
  #      Gosu.draw_rect(x * TILE_SIZE + 1, y * TILE_SIZE + 1, TILE_SIZE - 1, TILE_SIZE - 1, Gosu::Color::BLACK)
  #    end
  #  end
	draw_hollow_rect(@tile_x * TILE_SIZE + 1, @tile_y * TILE_SIZE + 1, TILE_SIZE - 1, TILE_SIZE - 1, Gosu::Color::YELLOW)
  end

  def tile_at(x, y)
    tile_x = (x / TILE_SIZE).floor()
    tile_y = (y / TILE_SIZE).floor()

	@tile_x = tile_x
	@tile_y = tile_y
	
    [tile_x, tile_y]
  end
end
