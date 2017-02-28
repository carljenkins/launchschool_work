require_relative 'rock'
require_relative 'paper'
require_relative 'scissors'
require_relative 'lizard'
require_relative 'spock'

class Move
  include Comparable
  attr_accessor :value

  VALUES = {'rock' => Rock,
            'paper' => Paper,
            'scissors' => Scissors,
            'lizard' => Lizard,
            'spock' => Spock
           }

  def self.create_move(move_type)
    VALUES[move_type].new
  end


  def lizard?
    @value == 'lizard'
  end

  def spock?
    @value == 'spock'
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def to_s
    @value
  end
end
