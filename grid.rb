class Grid
  attr_reader :ships

  def initialize
    @ships = []
    @hits_on_other_opponent = []
    @misses_on_other_opponenet = []
  end

  def has_ship_on?(x, y)
    @ships.each { |ship| return ship if ship.covers?(x, y) }
    false
  end

  def place_ship(ship, x, y, horizontal)
    ship.place(x, y, horizontal)
    unless @ships.any? { |s| s.overlaps_with?(ship) }
      @ships << ship
    end
  end

  def fire_at(x, y)
    ship = has_ship_on?(x, y)
    ship && ship.fire_at(x, y)
  end

  def sunk?
    !@ships.empty? && @ships.all? { |ship| ship.sunk? }
  end

  def x_of(coordinates)
    coordinates[/\d+/].to_i
  end

  def y_of(coordinates)
    coordinates[0].ord - 'A'.ord + 1
  end

  def display
    display_with_block do |x, y|
      ship = has_ship_on?(x, y)
      if ship && ship.hit_on?(x, y)
        " X |"
      elsif ship
        " O |"
      else
        "   |"
      end
    end
  end

  def display_shots
    display_with_block do |x, y|
      if @hits_on_other_opponent.include?([x, y])
        " + |"
      elsif @misses_on_other_opponenet.include?([x, y])
        " - |"
      else
        "   |"
      end
    end
  end

  def display_with_block
    display_header
    display_line
    ("A".."J").each_with_index do |l, i|
      y = i + 1
      line = l + " |"
      (1..10).each do |x|
        line << yield(x, y)
      end
      puts line
    end
    display_line
  end

  def miss_opponent(coordinate)
    @misses_on_opponent << [x_of(coordinate), y_of(coordinate)]
  end

  def hit_opponent(coordinate)
    @hits_on_other_opponent << [x_of(coordinate), y_of(coordinate)]
  end

  private

    def display_header
      puts "    1   2   3   4   5   6   7   8   9   10"
    end

    def display_line
      puts "  -----------------------------------------"
    end
end
