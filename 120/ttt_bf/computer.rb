require_relative 'player'
require_relative 'move'

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.create_move(Move::VALUES.keys.sample)
  end
end