require_relative 'messages'
require_relative 'move'
require_relative 'player'

class Human < Player
  include Messages

  def set_name
    binding.pry
    n = ""
    loop do
      binding.pry
      display_request_for_name
      n = gets.chomp
      binding.pry
      break unless n.empty?
      display_name_invalid
    end
    binding.pry
    self.name = n
    binding.pry
  end

  def choose
    choice = nil
    loop do
      display_make_choice
      choice = gets.chomp
      break if Move::VALUES.include?(choice.downcase)
      display_try_again
    end
     self.move = Move.new(choice)
  end
end
