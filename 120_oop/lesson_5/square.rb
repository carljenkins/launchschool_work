#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
class Square
  attr_accessor :marker
  INITIAL_MARKER = ' '
  X_MARKER = 'X'
  MARKERS = %w[O # $ & ^ % * ! H]
  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def to_s
    @marker
  end
end
