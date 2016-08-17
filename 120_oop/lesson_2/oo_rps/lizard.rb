#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'spock'
require_relative 'paper'
require_relative 'move'

class Lizard < Move
  include Comparable
  def initialize
    @value = 'lizard'
  end

  def >(other)
    if other.is_a?(Paper.class) ||
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
