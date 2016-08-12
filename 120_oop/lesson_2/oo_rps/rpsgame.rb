# frozen_string_literal: true
require_relative 'player'
require_relative 'messages'
require_relative 'human'
require_relative 'computer'
require 'pry'

class RPSGame
  include Messages
  attr_accessor :human, :computer

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

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
