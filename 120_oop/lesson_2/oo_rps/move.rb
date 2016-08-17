#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
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
  include Comparable

  def initialize
    @value = 'rock'
  end

  def <=>(other)
    if other.is_a?(Scissors.class) ||
       other.is_a?(Lizard.class)
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
  include Comparable

  def initialize
    @value = 'spock'
  end

  def <=>(other)
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

class Lizard < Move
  include Comparable
  def initialize
    @value = 'lizard'
  end

  def <=>(other)
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

class Scissors < Move
  include Comparable

   def initialize
     @value = 'scissors'
   end

   def <=>(other)
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

class Paper < Move
  include Comparable
  def initialize
    @value = 'paper'
  end

  def <=>(other)
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
