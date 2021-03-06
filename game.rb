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

  def take_turn
    shot = @players.first.call_shot
    if @players.last.fire_at_coordinates(shot)
      @players.first.record_hit(shot)
      puts "Hit!"
    else
      @players.first.record_miss(shot)
      puts "Miss!"
    end
    @players = @players.reverse
  end

  def game_over
    @players.first.sunk?
  end

  def winner
    @players.last if game_over
  end

  def play
    welcome
    place_ships
    until game_over do
      take_turn
    end
    puts "Congratulations, #{winner.name}!  You won!"
  end
end
