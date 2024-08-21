class BarsGrapher
  def initialize(bar)
	@bar = bar
  end
 
  def draw1
    draw_bitmap_section1(0)
    draw_bitmap_section1(-@bar.bitmap_height + @bar.y_position)
  end
 
  def draw2
    draw_bitmap_section2(0)
    draw_bitmap_section2(-@bar.bitmap_height + @bar.y_position)
  end

  private

  def draw_bitmap_section1(offset_y)
    @bar.bitmap.draw(@bar.x_offset1, offset_y, 0)
  end 
 
  def draw_bitmap_section2(offset_y)
    @bar.bitmap.draw(@bar.x_offset1, offset_y, 0)
    @bar.bitmap.draw(@bar.x_offset2, offset_y, 0)
  end
end
