#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'player'
require_relative 'square'

class Computer < Player
  def initialize(marker = Square::X_MARKER)
    set_name
    self.marker = marker
    @score = 0
  end

  def set_name
    self.name = ['WOPR', "Samspson", "Cryogen" ,"Skynet"].sample
  end

  def move(board)
    board.empty_square_positions.sample
  end
end
