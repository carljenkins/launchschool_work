#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative '../lib/twentyone/game'

options = {}

game = TwentyOne::Game.new
game.play(options)
