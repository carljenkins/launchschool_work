require_relative 'player'
require_relative 'move'

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, please enter a name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose #{Move::VALUES.join(", ")}"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, that's not a valid choice."
    end
    self.move = Move.create_move(choice)
  end
end