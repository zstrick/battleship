class HumanPlayer < Player
  attr_reader :name

  def initialize(name="Dave")
    @name = name
    super()
  end

  def place_ships(lengths)
    ship_index = 0
    while ship_index < lengths.size
      length = lengths[ship_index]
      puts "#{name}, where would you like to place a ship of length #{length}?"
      starting_coordinate = get_user_input
      puts "Across or Down?"
      orientation = get_user_input

      if grid.place_ship(Ship.new(length), grid.x_of(starting_coordinate),
                      grid.y_of(starting_coordinate), orientation == "Across")
        ship_index += 1
      else
        puts "Unfortunately, that ship overlaps with one of your other ships. Please try again."
      end
    end
  end

  def call_shot
    puts "Dave, please enter the coordinates for your next shot (e.g. 'B10'):"
    shot_coordinates = get_user_input
  end

  def display_ocean_grid
    grid.display
  end

  def display_target_grid
    grid.display_shots
  end
end
