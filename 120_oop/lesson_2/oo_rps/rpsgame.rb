# frozen_string_literal: true
require_relative 'player'
require_relative 'messages'
require_relative 'human'
require_relative 'computer'
require 'pry'

class RPSGame
  include Messages
  attr_accessor :human, :computer

  WINNING_SCORE = 10

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play_again?
    answer = nil
    loop do
      display_play_again_message
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      display_y_or_n
    end
    return true if answer == 'y'
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
    human.choose
    computer.choose
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
    display_welcome_message
    loop do
      loop do
      start
      break if winner?
    end
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
