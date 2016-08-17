#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'scissors'
require_relative 'rock'
require_relative 'move'

class Spock < Move
  include Comparable

  def initialize
    @value = 'spock'
  end

  def >(other)
    if other.is_a?(Rock.class) ||
       other.is_a?(Scissors.class)
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
