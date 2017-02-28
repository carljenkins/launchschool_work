require_relative 'move'
require_relative 'scissors'
require_relative 'rock'

class Spock < Move

  def initialize
    self.value = 'spock'
  end

  def <=>(other)
    if other.is_a?(Scissors) ||
        other.is_a?(Rock)
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