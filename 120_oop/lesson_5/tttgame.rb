#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'messages'
require_relative 'board'
require_relative 'computer'
require_relative 'human'
require 'pry'
class TTTGame
  include Messages
  attr_accessor :board, :human, :computer

  def initialize
    @board = Board.new
    @computer = Computer.new
    @human = Human.new
  end

  def get_player_info
    get_player_name
    get_player_marker
  end

  def get_player_name
    name = nil
    loop do
      display_name_request
      name = gets.chomp
      break if !name.empty?
      display_must_enter_name
    end
    self.human.name = name
  end

  def get_player_marker
    marker = nil
    loop do
      display_marker_request
      puts Square::MARKERS.join(',')
      marker = gets.chomp
      break if Square::MARKERS.include?(marker)
      display_marker_invalid
    end
    self.human.marker = marker
  end

  def display_player_info
    puts "#{human.name} is a #{human.marker}    #{computer.name} is a #{computer.marker}"
  end

  def clear
    system 'clear'
  end

  def display_game_table
    clear
    display_player_info
    board.display
  end

  def human_turn
    square = human.move(board)
    board.set_square_at(square, human.marker)
  end

  def computer_turn
    square = computer.move(board)
    board.set_square_at(square, computer.marker)
  end

  def start_game
    loop do
      human_turn
      display_game_table
      break if  board.full? || board.someone_won?
      puts "Strategizing...."

      computer_turn
      display_game_table
      break if board.full? || board.someone_won?
    end
  end

  def play_again?
    response = nil
    loop do
      puts "Would you like to play again? (y,n)"
      response = gets.chomp
      break if ['y','n'].include?(response.downcase)
    end
    response == 'y'
  end

  def play
      clear
      display_welcome_message
      get_player_info
      loop do
        display_game_table
        start_game
        display_result
        break unless play_again?
        clear
        board.setup
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
