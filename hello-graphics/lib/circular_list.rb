class CircularList
  def initialize(items)
    @items = items
    @current_index = 0
  end

  def next
    current_item = @items[@current_index]
    @current_index = (@current_index + 1) % @items.length
    current_item
  end

  def current
    @items[@current_index]
  end

  def reset
    @current_index = 0
  end
end
