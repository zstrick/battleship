class ComputerPlayer < Player
  def name
    "HAL 9000"
  end

  def place_ships(lengths)
    lengths.each_with_index do |length, index|
      grid.place_ship(Ship.new(length), index + 1, 1, false)
    end
    puts "#{name} has placed its ships."
  end

  def call_shot
    letter = ("A".."J").to_a.sample
    number = (1..10).to_a.sample.to_s
    letter + number
  end
end
