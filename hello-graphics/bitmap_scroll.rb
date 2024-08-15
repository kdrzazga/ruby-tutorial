require 'gosu'

class ScrollingBitmapWindow < Gosu::Window
  def initialize
    super(800, 600, false) # Set window size
    self.caption = "Scrolling Bitmap Animation"

    @bitmap = Gosu::Image.new("res/bitmap.png") # Load your 300x15 bitmap
    @bitmap_height = 15
    @viewport_height = 15
    @scroll_speed = 0.5  # Speed of scrolling
    @y_position = 0    # Initial vertical position for scrolling
  end

  def update
    # Scroll down
    @y_position += @scroll_speed

    # Reset position if the bitmap has scrolled out of view
    if @y_position >= @bitmap_height
      @y_position = 0
    end
  end

  def draw
    # Draw two sections of the bitmap for continuous scrolling
    draw_bitmap_section(0)
    draw_bitmap_section(-@bitmap_height + @y_position)
  end

  private

  def draw_bitmap_section(offset)
    # Draw bitmap with an offset to create scrolling effect
    @bitmap.draw(0, offset, 0)
  end
end

# Create the window and show it
ScrollingBitmapWindow.new.show
