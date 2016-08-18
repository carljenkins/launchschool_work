#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'scissors'
require_relative 'lizard'
require_relative 'move'

class Rock < Move

  def initialize
    @value = 'rock'
  end

  def <=>(other)
    if other.is_a?(Scissors) ||
       other.is_a?(Lizard)
      1
    elsif other.class == self.class
      0
    else
      -1
    end
  end

  def to_s
    self.value
  end
end
