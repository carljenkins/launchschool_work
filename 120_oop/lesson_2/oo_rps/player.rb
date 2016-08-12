# frozen_string_literal: true
class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end
