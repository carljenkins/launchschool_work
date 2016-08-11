require_relative 'player'
require_relative 'move'

class Computer < Player

  def initialize
    set_name
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  def set_name
    self.name = ['Hal 2000', 'Novac', 'Colossus', 'WOPR','Answertron 2000'].sample
  end

end
