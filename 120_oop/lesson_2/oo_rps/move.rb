#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
class Move
  include Comparable

  attr_accessor :value
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def initialize(move_value)
    self.value = move_value
  end

  def <=>(other)
    return nil unless other.is_a?(self.class)
    if scissors_wins?(other) ||
       spock_wins?(other)    ||
       rock_wins?(other)     ||
       paper_wins?(other)    ||
       lizard_wins?(other)
      1
    elsif value == other.value
      0
    else
      -1
    end
  end

  def scissors_wins?(other)
    scissors? && other.paper? ||
      scissors? && other.spock?
  end

  def spock_wins?(other)
    spock? && other.scissors? ||
      spock? && other.rock?
  end

  def rock_wins?(other)
    rock? && other.scissors? ||
      rock? && other.lizard?
  end

  def paper_wins?(other)
    paper? && other.rock? ||
      paper? && other.spock?
  end

  def lizard_wins?(other)
    lizard? && other.spock? ||
      lizard? && other.paper?
  end

  def rock?
    value == 'rock'
  end

  def paper?
    value == 'paper'
  end

  def scissors?
    value == 'scissors'
  end

  def lizard?
    value == 'lizard'
  end

  def spock?
    value == 'spock'
  end

  def to_s
    value
  end
end
