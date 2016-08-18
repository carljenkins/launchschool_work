#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'rock'
require_relative 'paper'
require_relative 'scissors'
require_relative 'lizard'
require_relative 'spock'
class Player
  attr_accessor :move, :name, :score, :history

  def initialize
    @score = 0
    @history = {}
    set_name
  end
end
