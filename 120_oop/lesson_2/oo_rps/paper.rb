#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'spock'
require_relative 'rock'
require_relative 'move'

class Paper < Move
  include Comparable
  def initialize
    @value = 'paper'
  end

  def >(other)
    if other.is_a?(Rock.class) ||
       other.is_a?(Spock.class)
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
