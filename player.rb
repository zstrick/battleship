class Player
  attr_reader :grid
  def initialize
    @grid = Grid.new
  end

  def ships
    grid.ships
  end

  def record_hit(coordinates)
    grid.hit_opponent(coordinates)
  end

  def record_miss(coordinates)
    grid.miss_opponent(coordinates)
  end
end
