#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
# require_relative 'rock'
# require_relative 'paper'
# require_relative 'scissors'
# require_relative 'lizard'
# require_relative 'spock'
class Move
  include Comparable

  attr_accessor :value
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock'].freeze

  def self.create_move(type)
    { 'rock' => Rock,
      'paper' => Paper,
      'scissors' => Scissors,
      'lizard' => Lizard,
      'spock' => Spock
    }[type].new
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

class Spock < Move
  def initialize
    @value = 'spock'
  end

  def <=>(other)
    if other.is_a?(Rock) ||
       other.is_a?(Scissors)
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

class Lizard < Move
  include Comparable
  def initialize
    @value = 'lizard'
  end

  def <=>(other)
    if other.is_a?(Paper) ||
       other.is_a?(Spock)
      1
    elsif other.is_a? Lizard
      0
    else
      -1
    end
  end

  def to_s
    self.value
  end
end

class Scissors < Move
   def initialize
     @value = 'scissors'
   end

   def <=>(other)
     if other.is_a?(Paper) ||
        other.is_a?(Spock)
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

class Paper < Move
  def initialize
    @value = 'paper'
  end

  def <=>(other)
    if other.is_a?(Rock) ||
       other.is_a?(Spock)
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
