class Position
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @hit = false
  end

  def hit!
    @hit = true
  end

  def hit?
    @hit
  end
end
