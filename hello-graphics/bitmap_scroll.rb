require 'gosu'
require_relative 'lib/bars/bars'
require_relative 'lib/bars/grapher'

class ScrollingBitmapWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = "Scrolling Bitmap Animation"
	bitmap = Gosu::Image.new("res/bitmap.png")
	@bar = Bars.new(bitmap, 150, 200)
	@bars_grapher = BarsGrapher.new(@bar)
	
    @viewport_height = 15
  end

  def update
	@bar.move()
  end

  def draw
    @bars_grapher.draw1()
  end

end

ScrollingBitmapWindow.new.show
