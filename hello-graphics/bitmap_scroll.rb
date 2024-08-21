require 'gosu'

class ScrollingBitmapWindow < Gosu::Window
  def initialize
    super(800, 600, false)
    self.caption = "Scrolling Bitmap Animation"

    @bitmap = Gosu::Image.new("res/bitmap.png")
    @bitmap_height = 15
    @viewport_height = 15
    @scroll_speed = 0.5
    @y_position = 0
  end

  def update
    @y_position += @scroll_speed
    if @y_position >= @bitmap_height
      @y_position = 0
    end
  end

  def draw
    draw_bitmap_section(0)
    draw_bitmap_section(-@bitmap_height + @y_position)
  end

  private

  def draw_bitmap_section(offset)
    @bitmap.draw(0, offset, 0)
  end
end

ScrollingBitmapWindow.new.show
