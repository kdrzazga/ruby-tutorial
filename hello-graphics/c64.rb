#gem install gosu  (this takes a few minutes)
#gem install ruby2d

require 'ruby2d'
require 'gosu'
require_relative 'lib/circular_list'

class C64Window < Gosu::Window
  LINE_HEIGHT = 16
  BORDER_SIZE = 80
  FONT_WIDTH = 0.52

  def initialize
    super 800, 600, fullscreen: true
    self.caption = "Commodore 64"
    @x = 0
    
    @font = Gosu::Font.new(30, name: 'res/C64_Pro_Mono-STYLE.ttf')
	images = CircularList.new([
      Gosu::Image.new("res/frames/1.png"),
      Gosu::Image.new("res/frames/2.png"),
      Gosu::Image.new("res/frames/3.png"),
      Gosu::Image.new("res/frames/4.png"),
      Gosu::Image.new("res/frames/5.png"),
      Gosu::Image.new("res/frames/6.png"),
      Gosu::Image.new("res/frames/7.png")
    ])
    
    @image = images.next
    @images = images
    @sound = Gosu::Sample.new('res/ode.mp3')
    @sound.play(1, 1, true)
  end

  def draw # this method is continuously called by default
    Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(255, 73, 73, 73))
    Gosu.draw_rect(BORDER_SIZE, BORDER_SIZE + 45, self.width - 2 * BORDER_SIZE, self.height - 3 * BORDER_SIZE, Gosu::Color.argb(255, 151, 151, 151))
    
    @font.draw_text("* C-64 BASIC IMPROVED BY BLACK BOX V.3 *", BORDER_SIZE, BORDER_SIZE - 30, 0, FONT_WIDTH, 0.56, Gosu::Color.argb(255, 151, 151, 151))
    @font.draw_text("64K RAM SYSTEM   38911   BASIC BYTES FREE", BORDER_SIZE, BORDER_SIZE + 0*LINE_HEIGHT + 12, 0, FONT_WIDTH, 0.56, Gosu::Color.argb(255, 151, 151, 151))
    
    captions = [
      ["READY.", 4 * LINE_HEIGHT],
      [("#{[0x2190].pack('U*')}L"), 5 * LINE_HEIGHT],
      ["PRESS PLAY ON TAPE", 7 * LINE_HEIGHT],
      ["OK", 8 * LINE_HEIGHT],
      ["FOUND ODE TO JOY", 10 * LINE_HEIGHT],
      ["HEADERTYPE:   1", 12 * LINE_HEIGHT],
      ["STARTADDRESS: 2049", 14 * LINE_HEIGHT],
      ["ENDADDRESS:   2050", 16 * LINE_HEIGHT],
      ["LOADING", 18 * LINE_HEIGHT],
      ["READY.", 19 * LINE_HEIGHT],
      [("#{[0x2190].pack('U*')}NK:R#{[0x256E].pack('U*')}"), 20 * LINE_HEIGHT]
    ]
    
    captions.each do |caption, offset|
      @font.draw_text(caption, BORDER_SIZE, BORDER_SIZE + offset, 0, FONT_WIDTH, 0.56, Gosu::Color::BLACK)
    end
    
    @image.draw(self.width -  BORDER_SIZE - 80, self.height - 1.5*BORDER_SIZE - 99)

    blink_cursor()
  end
  
  def blink_cursor()
    @x = @x + 1

    if @x > 13
      @x = 0
	  @image = @images.next
    end
  end
  
	def update
		close if Gosu.button_down?(Gosu::KbEscape)
	end

end

C64Window.new.show
