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
    @game.step
  end

  def draw
	Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(255, 0xaa, 0xaa, 0xaa))
	@game.base.draw(0, 450)
    @game.board.draw
	img = Gosu::Image.new(@game.lemmings[0].path)
	@game.lemmings.each do |lemming|
		board_x, board_y = lemming.position
		x, y = @game.board.screen_pos(board_x, board_y)
		img.draw(x, y)
	end
  end

  def button_down(id)
    case id
    when Gosu::MsLeft
      x, y = mouse_x, mouse_y
      tile_x, tile_y = @game.board.tile_at(x, y)
	  
	  msg = "Clicked (#{x}, #{y}) - tile: (#{tile_x}, #{tile_y}) "
	  
	  focused_lemming = nil
	  @game.lemmings.each do |lemming|
		msg += lemming.tile[0].to_s + ", " + lemming.tile[1].to_s
		if lemming.tile[0] == tile_x and lemming.tile[1] == tile_y
			msg += " " + lemming.to_string 
			focused_lemming = lemming
		end
	  end
      puts msg
	  
	  if focused_lemming != nil
		focused_lemming.set_class(LemmingClass::BLOCKER)
	  end
	
    end
  end
end

window = GameWindow.new
window.show
