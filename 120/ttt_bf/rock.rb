require_relative 'scissors'
require_relative 'lizard'
require_relative 'move'

class Rock < Move

  def initialize
    self.value = 'rock'
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
    value
  end


end