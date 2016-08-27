#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'square'
require 'pry'
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
      [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
      [[1, 5, 9], [3, 5, 7]].freeze

  attr_reader :squares

  def initialize
    @squares = {}
    setup
  end

  def empty_square_positions
    squares.select{|_,v| v.unmarked? }.keys
  end

  def get_square_at(key)
    squares[key]
  end

  def []=(square, marker)
    squares[square].marker = marker
  end

  def full?
    empty_square_positions.empty?
  end

  def human_won?
    !!detect_human_marker
  end

  def computer_won?
    !!detect_computer_marker
  end

  def someone_won?
    !!detect_human_marker || !!detect_computer_marker
  end

  def detect_computer_marker
    marker = nil
    WINNING_LINES.each do |lines|
      if count_squares(Square::X_MARKER,lines) == 3
        marker = Square::X_MARKER
      end
    end
    marker
  end

  def detect_human_marker
    marker = nil
    Square::MARKERS.each do |m|
      WINNING_LINES.each do |lines|
        if count_squares(m,lines) == 3
          marker = m
        end
      end
    end
    marker
  end

  def count_squares(m, lines)
    squares.values_at(*lines).count{|s| s.marker == m }
  end


  def setup
    (1..9).each{ |num| @squares[num] = Square.new }
  end

  def display
    puts ""
    puts "     |     |  "
    puts "  #{get_square_at(1)}  |  #{get_square_at(2)}  |   #{get_square_at(3)}"
    puts "     |     |  "
    puts "-----+-----+-----"
    puts "     |     |  "
    puts "  #{get_square_at(4)}  |  #{get_square_at(5)}  |   #{get_square_at(6)}"
    puts "     |     |  "
    puts "-----+-----+-----"
    puts "     |     |  "
    puts "  #{get_square_at(7)}  |  #{get_square_at(8)}  |   #{get_square_at(9)}"
    puts "     |     |  "
    puts ""
  end
end
