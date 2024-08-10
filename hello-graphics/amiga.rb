require 'ruby2d'
require 'gosu'

class Amiga < Gosu::Window
  LINE_HEIGHT = 16
  BORDER_SIZE = 80
  FONT_WIDTH = 0.52
  COLORS = [
    Gosu::Color::WHITE,
    Gosu::Color.argb(255, 73, 73, 73),      # Dark Grey
    Gosu::Color.argb(255, 0, 85, 170)       # Light Blue
  ]

  def initialize
    puts "Elapsed time #{Gosu.milliseconds}"
    super 800, 600, fullscreen: true
    self.caption = "Amiga 500"
    
    @phase = 1
    @font = Gosu::Font.new(30, name: 'res/Topaz_a500_v1.0.ttf')
    @time_elapsed = 0
    @color_index = 0
  end
  
  def draw
    case @phase
    when 1
      phase1_draw
    when 2
      phase2_draw	
    end  # End of case statement
  end
  
  def update
    close if Gosu.button_down?(Gosu::KbEscape)
    
    if Gosu.milliseconds < 4000
      @phase = 1
      phase1
    elsif Gosu.milliseconds < 8000
      @phase = 2
      phase2
    else
      close
    end
  end
  
  def phase1
    @color_index += 1
    @color_index = [@color_index, COLORS.length - 1].min
    
    puts "PHASE 1: #{Gosu.milliseconds}"
  end
  
  def phase1_draw
    Gosu.draw_rect(0, 0, self.width, self.height, COLORS[@color_index])
  end
  
  def phase2
    puts "PHASE 2: #{Gosu.milliseconds}"
  end
  
  def phase2_draw
    Gosu.draw_rect(0, 0, self.width, self.height, COLORS[2])
    Gosu.draw_line(1, 1, Gosu::Color::WHITE, self.width, 1, Gosu::Color::WHITE)
    Gosu.draw_line(self.width, 1, Gosu::Color::WHITE, self.width, 2 * self.height / 3, Gosu::Color::WHITE)
    Gosu.draw_line(self.width, 2 * self.height / 3, Gosu::Color::WHITE, 1, 2 * self.height / 3, Gosu::Color::WHITE)
  end  # End of phase2_draw method

end

Amiga.new.show
