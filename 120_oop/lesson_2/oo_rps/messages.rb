# frozen_string_literal: true
require 'yaml'
module Messages
  LANGUAGE = 'en'
  MESSAGES = YAML.load_file('rps_game_messages.yml')

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

  def display_moves
    puts "#{computer.name} chose #{computer.move}"
    puts "#{human.name} chose #{human.move}"
    puts
  end

  def display_winner
    if human.move > computer.move
      puts messages('human_won')
    elsif human.move == computer.move
      puts messages('tie')
    else
      puts messages('computer_won')
        .gsub('computer', computer.name)
    end
  end
end
