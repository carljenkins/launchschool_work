# frozen_string_literal: true
class Move
  include Comparable

  attr_accessor :value
  VALUES = ['rock', 'paper', 'scissors'].freeze

  def initialize(move_value)
    self.value = move_value
  end

  # -1  less than
  # 0   equal to
  # +1  greater than
  def <=>(other)
    return nil unless other.is_a?(self.class)
    if rock? && other.scissors? ||
       paper? && other.rock?    ||
       scissors? && other.paper?
      1
    elsif value == other.value
      0
    else
      -1
    end
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

  def to_s
    value
  end
end
