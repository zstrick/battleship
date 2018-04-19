class Ship
  attr_reader :length

  def initialize(length)
    @length = length
    @positions = []
  end

  def placed_on_board?
    @positions != []
  end

  def place(x, y, horizontal)
    unless placed_on_board?
      if horizontal
        x.upto(x + (length - 1)) { |x| @positions << Position.new(x, y) }
      else
        y.upto(y + (length - 1)) { |y| @positions << Position.new(x, y) }
      end
    end
  end

  def covers?(x, y)
    @positions.each do |position|
      return position if position.x == x && position.y == y
    end
    false
  end

  def overlaps_with?(other_ship)
    @positions.any? { |position| other_ship.covers?(position.x, position.y) }
  end

  def fire_at(x, y)
    position = covers?(x, y)
    position && position.hit!
  end

  def sunk?
    !@positions.empty? && @positions.all?(&:hit?)
  end

  def hit_on?(x, y)
    position = covers?(x, y)
    position && position.hit?
  end

  def fire_at(x, y)
    position = covers?(x, y)
    position && position.hit!
  end
end
