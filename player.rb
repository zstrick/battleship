class Player
  attr_reader :grid
  def initialize
    @grid = Grid.new
  end
end

class HumanPlayer < Player
  attr_reader :name

  def initialize(name="Dave")
    @name = name
    super()
  end
end

class ComputerPlayer < Player
  def name
    "HAL 9000"
  end
end
