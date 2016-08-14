#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'messages'
require_relative 'move'
require_relative 'player'

class Human < Player
  include Messages

  def set_name
    n = ""
    loop do
      display_request_for_name
      n = gets.chomp
      break unless n.empty?
      display_name_invalid
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      display_make_choice
      choice = gets.chomp
      break if Move::VALUES.include?(choice.downcase)
      display_try_again
    end
     self.move = Move.new(choice)
  end
end
