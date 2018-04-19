class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    welcome
  end

  def welcome
    puts "Welcome, #{@players[0].name} and #{@players[1].name}!"
    puts "It's time to play Battleship."
  end

  def place_ships
    @players.each { |player| player.place_ships([2, 3, 3, 4, 5])}
  end

  def display_status
    puts "SHOTS TAKEN:"
    @players.first.display_target_grid
    puts
    puts "YOUR BOARD:"
    @players.first.display_ocean_grid
  end
end
