#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'player'
require_relative 'move'
require_relative 'personality'

class Computer < Player
  include Personality

  def initialize
    super
    self.apply_personality_mod = 'Colossus'
  end

  def choose
    weighted_move = find_weighted_move(@name)
    require 'pry'; binding.pry
    @move = if weighted_move
              Move.create_move(weighted_move)
            else
              @move = Move.create_move(Move::VALUES.sample)
            end
  end

  def set_name
    @name = 'Colossus'
      # ['Hal 2000', 'Novac', 'Colossus', 'WOPR', 'Answertron 2000'].sample
  end
end
