#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'player'
require_relative 'messages'
class Human < Player
  include Messages

  def initialize
    @score = 0
  end

  def move(board)
    puts "Choose a square (#{joinor(board.empty_square_positions)}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.empty_square_positions.include?(square)
      display_marker_invalid
    end
    square
  end
end
