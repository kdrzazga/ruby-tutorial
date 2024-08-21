require 'ruby2d'
require 'gosu'
require_relative 'lib/circular_list'

class C64Window < Gosu::Window
  LINE_HEIGHT = 16
  BORDER_SIZE = 80
  FONT_WIDTH = 0.52

  def initialize
    super 800, 600, fullscreen: true
    self.caption = "Rubivaders"
    @x = 0
    
    @font = Gosu::Font.new(30, name: 'res/C64_Pro_Mono-STYLE.ttf')    
    @board = Array.new(50) { Array.new(37, '.') }

    @start_time = Gosu.milliseconds
	@display_header = true
	
    @music_playing = false
  end

  def draw
    display_black_box_header
  end
  
  def update
    close if Gosu.button_down?(Gosu::KbEscape)

    elapsed_time = (Gosu.milliseconds - @start_time) / 1000.0
  end
  
  def restart_program
	puts "Restart..."
	exec('ruby', $PROGRAM_NAME, *ARGV) # Restart the current script
  end
  
  def display_black_box_header
	if @display_header == true
		Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(255, 73, 73, 73))
		Gosu.draw_rect(BORDER_SIZE, BORDER_SIZE + 45, self.width - 2 * BORDER_SIZE, self.height - 3 * BORDER_SIZE, Gosu::Color.argb(255, 151, 151, 151))
		
		@font.draw_text("* C-64 BASIC IMPROVED BY BLACK BOX V.3 *", BORDER_SIZE, BORDER_SIZE - 30, 0, FONT_WIDTH, 0.56, Gosu::Color.argb(255, 151, 151, 151))
		@font.draw_text("64K RAM SYSTEM   38911   BASIC BYTES FREE", BORDER_SIZE, BORDER_SIZE + 0 * LINE_HEIGHT + 12, 0, FONT_WIDTH, 0.56, Gosu::Color.argb(255, 151, 151, 151))
	end
  end
end

C64Window.new.show
