#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require 'YAML'
module TTT
module Messages
  LANGUAGE = 'en'.freeze
  MESSAGES = YAML.load_file('ttt_game_messages.yml')

  def messages(message, lang = 'en')
    puts MESSAGES[lang][message]
  end

  def display_welcome_message
    messages('welcome')
  end

  def display_goodbye_message
    messages('goodbye')
  end

  def display_name_request
    messages('request_name')
  end

  def display_must_enter_name
    messages('name_invalid')
  end

  def display_marker_request
    messages('marker_request')
  end

  def display_marker_invalid
    messages('marker_invalid')
  end

  def display_result
    if board.human_won?
      messages('human_won')
    elsif board.computer_won?
      messages('computer_won')
    else
      messages('tie')
    end
  end

  def display_score_board
    puts "Current Score: "
    puts "#{human.name}: #{human.score}  #{computer.name}:  #{computer.score}"
    puts
  end

  def joinor(arr, sep = ', ', orclause='or ')
    (arr * sep).insert(-2, orclause)
  end
end
end
