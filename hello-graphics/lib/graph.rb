def draw_hollow_rect(x, y, width, height, color)
  Gosu.draw_line(x, y, color, x + width, y, color)
  Gosu.draw_line(x, y + height, color, x + width, y + height, color)
  Gosu.draw_line(x, y, color, x, y + height, color)
  Gosu.draw_line(x + width, y, color, x + width, y + height, color)
end