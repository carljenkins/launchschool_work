require_relative 'move'
require_relative 'spock'
require_relative 'paper'

class Lizard < Move

  def initialize
    self.value = 'lizard'
  end

  def <=>(other)
    if other.is_a?(Spock) ||
        other.is_a?(Paper)
      1
    elsif other.class == self.class
      0
    else
      -1
    end
  end

  def to_s
    @value
  end

end