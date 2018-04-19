class Grid
  def initialize
    @ships = []
  end

  def has_ship_on?(x, y)
    @ships.any? { |ship| ship.covers?(x, y) }
  end

  def place_ship(ship, x, y, horizontal)
    ship.place(x, y, horizontal)
    unless @ships.any? { |s| s.overlaps_with?(ship) }
      @ships << ship
    end
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

  private

    def display_header
      puts "    1   2   3   4   5   6   7   8   9   10"
    end

    def display_line
      puts "  -----------------------------------------"
    end
end
