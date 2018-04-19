class Game
  def initialize(player1, player2)
    @players = [player1, player2]
    welcome
  end

  def welcome
    puts "Welcome, #{@players[0].name} and #{@players[1].name}!"
    puts "It's time to play Battleship."
  end
end
