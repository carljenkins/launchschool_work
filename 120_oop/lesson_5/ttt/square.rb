#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
class Square
  attr_accessor :marker
  INITIAL_MARKER = ' '.freeze
  X_MARKER = 'X'.freeze
  MARKERS = %w(O # $ & ^ % * ! H).freeze
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
