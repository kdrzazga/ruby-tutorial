# game.rb
require 'gosu'
require_relative 'lib/board'
require_relative 'lib/game'

class GameWindow < Gosu::Window
  WIDTH = 640
  HEIGHT = 480
  
  def initialize
    super WIDTH, HEIGHT
    self.caption = "Rubbings Game"
    
	@game = Game.new()
  end

  def update
    # Update logic can go here if needed
  end

  def draw
	Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(255, 0xaa, 0xaa, 0xaa))
	@game.base.draw(0, 450)
    @game.board.draw
	img = Gosu::Image.new(@game.lemming.path)
	img.draw(1, 400)
  end

  def button_down(id)
    case id
    when Gosu::MsLeft
      x, y = mouse_x, mouse_y
      tile_x, tile_y = @game.board.tile_at(x, y)
      puts "Clicked (#{x}, #{y}) - tile: (#{tile_x}, #{tile_y})"
    end
  end
end

# Start the game
window = GameWindow.new
window.show
