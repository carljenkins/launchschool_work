require_relative 'paper'
require_relative 'lizard'
require_relative 'move'


class Scissors < Move
  def initialize
    self.value = 'scissors'
  end

  def <=>(other)
    if other.is_a?(Paper) ||
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