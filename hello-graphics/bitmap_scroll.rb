require 'gosu'

class Bar
	attr_reader :bitmap, :y_position, :bitmap_height

	def initialize
		@bitmap = Gosu::Image.new("res/bitmap.png")
		@y_position = 0
		@bitmap_height = 15
		@scroll_speed = 0.5
	end
	
	def move
		@y_position += @scroll_speed
		if @y_position >= @bitmap_height
			@y_position = 0
		end
	end
end


class ScrollingBitmapWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = "Scrolling Bitmap Animation"
	
	@bar = Bar.new()

    @viewport_height = 15
  end

  def update
	@bar.move()
  end

  def draw
    draw_bitmap_section(0)
    draw_bitmap_section(-@bar.bitmap_height + @bar.y_position)
  end

  private

  def draw_bitmap_section(offset)
    @bar.bitmap.draw(0, offset, 0)
  end
end

ScrollingBitmapWindow.new.show
