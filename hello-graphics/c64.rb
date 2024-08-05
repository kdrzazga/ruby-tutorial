require 'ruby2d'
require 'gosu'

class C64Window < Gosu::Window
  LINE_HEIGHT = 21

  def initialize
    super 800, 600, fullscreen: true
    self.caption = "Commodore 64"
    @border_size = 60
    @x = 0
    
    @font = Gosu::Font.new(30, name: 'res/C64_Pro_Mono-STYLE.ttf')
    @image = Gosu::Image.new("res/plane.png")
    @sound = Gosu::Sample.new('res/ode.mp3')
    @sound.play
  end

  def draw # this method is continuously called by default
    Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(255, 97, 97, 97))
    Gosu.draw_rect(@border_size, @border_size + 45, self.width - 2 * @border_size, self.height - 3 * @border_size, Gosu::Color.argb(255, 151, 151, 151))
    
    @font.draw_text("* C-64 BASIC IMPROVED BY BLACK BOX V.3 *", @border_size, @border_size - 30, 0, 0.56, 0.56, Gosu::Color.argb(255, 151, 151, 151))
    @font.draw_text("64K RAM SYSTEM   38911   BASIC BYTES FREE", @border_size, @border_size + 0*LINE_HEIGHT + 12, 0, 0.56, 0.56, Gosu::Color.argb(255, 151, 151, 151))
    
    captions = [
      ["READY.", 3 * LINE_HEIGHT],
      [("#{[0x2190].pack('U*')}L"), 4 * LINE_HEIGHT],
      ["PRESS PLAY ON TAPE", 6 * LINE_HEIGHT],
      ["OK", 7 * LINE_HEIGHT],
      ["FOUND", 9 * LINE_HEIGHT],
      ["HEADERTYPE:   1", 11 * LINE_HEIGHT],
      ["STARTADDRESS: 2049", 13 * LINE_HEIGHT],
      ["ENDADDRESS:   2050", 15 * LINE_HEIGHT],
      ["LOADING", 17 * LINE_HEIGHT],
      ["READY.", 18 * LINE_HEIGHT]
    ]
    
    captions.each do |caption, offset|
      @font.draw_text(caption, @border_size, @border_size + offset, 0, 0.56, 0.56, Gosu::Color::BLACK)
    end
    
    @image.draw(@x, 300, 0)

    blink_cursor()
  end
  
  def blink_cursor()
    @x = @x + 1

    if @x > 630
      @x = 0
    end
  end
  
	def update
		close if Gosu.button_down?(Gosu::KbEscape)
	end

end

C64Window.new.show
