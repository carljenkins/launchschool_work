#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'player'
require_relative 'square'
require_relative 'tttgame_strategy'

class Computer < Player
  include TTTGameStrategy

  def initialize(marker = Square::X_MARKER)
    set_name
    self.marker = marker
    @score = 0
  end

  def set_name
    self.name = ['WOPR', "Samspson", "Cryogen" ,"Skynet"].sample
  end

  def move(board)
    defensive = find_defensive_move(board)
    return defensive if defensive
    board.empty_square_positions.sample
  end
end
