require_relative 'rock'
require_relative 'paper'
require_relative 'scissors'
require_relative 'lizard'
require_relative 'spock'


class Player
  attr_accessor :move, :name, :score

  def initialize
    self.move = nil
    self.score = 0
    set_name
  end
end