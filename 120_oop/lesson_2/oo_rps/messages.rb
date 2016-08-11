require 'yaml'

module Messages

  LANGUAGE = 'en'
  MESSAGES = YAML.load_file('rps_game_messages.yml')

  def initialize

  end

  def messages(message, lang = 'en')
    MESSAGES[lang][message]
  end

  def display_welcome_message
    puts messages('welcome')
  end

  def display_goodbye_message
    puts messages('goodbye')
  end

  def display_make_choice
    puts messages('make_choice')
  end

  def display_try_again
    puts messages('try_again')
  end

  def display_play_again_message
    puts messages('play_again')
  end

  def display_y_or_n
    puts messages('y_or_n')
  end

  def display_request_for_name
    puts messages('request_name')
  end

  def display_name_invalid
    puts messages('name_invalid')
  end

  def display_winner
    puts "#{computer.name} chose #{computer.move}"
    puts "#{human.name} chose #{human.move}"
    if human.move > computer.move
      puts "Awesome, you won!"
    elsif human.move == computer.move
      puts "It is a tie!"
    else
      puts "The computer won!"
    end
  end
end
