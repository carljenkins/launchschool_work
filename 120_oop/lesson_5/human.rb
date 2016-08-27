#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'player'
require_relative 'messages'
class Human < Player
  include Messages
  def move(board)
    puts "Choose a square (#{board.empty_square_positions.join(', ')}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.empty_square_positions.include?(square)
      display_marker_invalid
    end
    square
  end
end
