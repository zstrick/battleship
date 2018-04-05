class Ship
  attr_reader :length, :coverage
  def initialize(length)
    @length = length
    @coverage = []
    @on_board = false
  end

  def place(x, y, horizontal)
    unless on_board?
      if horizontal
        x.upto(x + (length - 1)) { |x| @coverage << [x, y] }
      else
        y.upto(y + (length - 1)) { |y| @coverage << [x, y] }
      end
      @on_board = true
    end
  end

  def covers?(x, y)
    @coverage.include?([x, y])
  end

  def on_board?
    @on_board
  end

  def overlaps_with?(other_ship)
    other_ship.coverage.any? do |coordinate|
      covers?(coordinate[0], coordinate[1])
    end
  end
end
