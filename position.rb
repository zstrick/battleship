class Position
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
    @hit = false
  end

  def hit!
    if @hit
      false
    else
      @hit = true
    end
  end

  def hit?
    @hit
  end
end
