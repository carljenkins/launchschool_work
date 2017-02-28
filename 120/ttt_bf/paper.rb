require_relative 'spock'
require_relative 'rock'
require_relative 'move'

class Paper < Move
  def initialize
    self.value = 'paper'
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
    value
  end


end