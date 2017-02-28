require_relative 'human'
require_relative 'computer'


class RPSGame
  attr_accessor :human, :computer
  SCORE_LIMIT = 10

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      human.score += 1
      puts "#{human.name} won!"
    elsif human.move < computer.move
      computer.score += 1
      puts "#{computer.name} won!"
    elsif human.move == computer.move
      puts "It's a tie!"
    end
  end

  def display_scores
    puts "     -----Scores-----"
    puts "#{human.name} : #{human.score}"
    puts "#{computer.name} : #{computer.score}"
  end

  def display_welcome_message
    puts "Welcome to #{Move::VALUES.keys.join(", ")}!"
  end

  def display_goodbye_message
    puts "Thanks for playing, Bye!"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def game_over?
    (human.score == 10) ||
      (computer.score == 10)
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_moves
        display_winner
        display_scores
        break if game_over?
      end
      break unless play_again?
    end
    display_goodbye_message
  end
end


RPSGame.new.play
