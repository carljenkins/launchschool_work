#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'messages'
require_relative 'board'
require_relative 'computer'
require_relative 'human'
class TTTGame
  include Messages
  attr_accessor :board, :human, :computer, :current_marker

  def initialize
    @board = Board.new
    @computer = Computer.new
    @human = Human.new
    @current_marker = nil
  end

  private

  def get_player_info
    get_player_name
    get_player_marker
    self.current_marker = human.marker
  end

  def get_player_name
    name = nil
    loop do
      display_name_request
      name = gets.chomp
      break unless name.empty?
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
    human.marker = marker
  end

  def display_player_info
    puts "#{human.name} is a #{human.marker}   #{computer.name} is a #{computer.marker}"
  end

  def clear
    system 'clear'
  end

  def display_game_table
    clear
    display_player_info
    board.display
  end

  def human_moves
    square = human.move(board)
    board[square] = human.marker
  end

  def computer_moves
    square = computer.move(board)
    board[square] = computer.marker
  end

  def human_turn?
    current_marker == human.marker
  end

  def make_moves
    if human_turn?
      human_moves
      self.current_marker = computer.marker
    else
      computer_moves
      self.current_marker = human.marker
    end
  end

  def start_game
    loop do
      make_moves
      display_game_table
      break if board.full? || board.someone_won?
    end
  end

  def play_again?
    response = nil
    loop do
      puts 'Would you like to play again? (y,n)'
      response = gets.chomp
      break if %w[y, n].include?(response.downcase)
    end
    response == 'y'
  end

  public

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
