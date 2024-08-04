#gem install gosu  (this takes a few minutes)

require 'gosu'

class TriangleWindow < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Gosu Triangle Example"
	
	@font = Gosu::Font.new(30, name: 'res/Bionic City.otf')
  end

  def draw # this method is continuously called by default
	Gosu.draw_rect(0, 0, self.width, self.height, Gosu::Color.argb(255, 0x35, 0x28, 0x79))

    draw_triangle(100, 50,
                  150, 150,
                  50, 150)

	@font.draw_text("Hello Gosu Graphics", 200, 200, 0, 1.0, 1.0, Gosu::Color::CYAN)
  end

  def draw_triangle(x1, y1, x2, y2, x3, y3)
    Gosu.draw_line(x1, y1, Gosu::Color::WHITE, x2, y2, Gosu::Color::WHITE, 0)
    Gosu.draw_line(x2, y2, Gosu::Color::WHITE, x3, y3, Gosu::Color::WHITE, 0)
    Gosu.draw_line(x3, y3, Gosu::Color::WHITE, x1, y1, Gosu::Color::WHITE, 0)
  end
end

TriangleWindow.new.show
