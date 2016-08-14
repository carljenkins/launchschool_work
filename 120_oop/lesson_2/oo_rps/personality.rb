#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
module Personality

  def find_weighted_move(person)
    @weighted_values = {}
    move = nil
    if person == @modify_name
      build_weighted_values
      move = find_weighted_key
    end
    move
  end

  def apply_personality_mod=(name)
    @modify_name = name
  end

  private

  def build_weighted_values
    @weighted_values['rock'] = (0..60)
    @weighted_values['paper'] = (61..70)
    @weighted_values['scissors'] = (71..90)
    @weighted_values['lizard'] = (91..95)
    @weighted_values['spock'] = (96..100)
  end

  def find_weighted_key
    random_number = rand((1..100))
    @weighted_values.select do |_k, wv|
      wv.include?(random_number)
    end.keys.join
  end
end
