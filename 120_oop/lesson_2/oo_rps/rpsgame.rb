#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'player'
require_relative 'messages'
require_relative 'human'
require_relative 'computer'
require 'pry'

class RPSGame
  include Messages
  attr_accessor :human, :computer, :round_count

  WINNING_SCORE = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round_count = 0
  end

  def play_again?
    answer = nil
    loop do
      display_play_again_message
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      display_y_or_n
    end
    if answer == 'y'
      @round_count += 1
      human.score = 0
      computer.score = 0
      initialize_history
    end
    return true if answer == 'y'
  end

  def initialize_history
    human.history['round' + @round_count.to_s] = []
    computer.history['round' + @round_count.to_s] = []
  end

  def assign_scores
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
    end
  end

  def winner?
    human.score == WINNING_SCORE ||
      computer.score == WINNING_SCORE
  end

  def take_turns
    move = human.choose
    human.history['round' + round_count.to_s] << move
    move = computer.choose
    computer.history['round' + round_count.to_s] << move
  end

  def start
    take_turns
    assign_scores
    display_moves
    display_winner
    display_score
    sleep 3
    system 'clear'
  end

  def play
    @round_count += 1
    initialize_history
    display_welcome_message
    loop do
      loop do
        start
        break if winner?
      end
      break unless play_again?
    end
    display_move_history
    display_goodbye_message
  end
end

RPSGame.new.play
