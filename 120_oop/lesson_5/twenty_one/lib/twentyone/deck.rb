#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
module TwentyOne
  class Deck
    attr_accessor :cards

    def initialize
      @cards = []
      Card::SUITS.each do |suit|
        Card::FACE.each do |face|
          cards << Card.new(suit, face)
        end
      end
    end

    def pop
      cards.pop
    end

    def <<(card)
      cards.push card
    end

    def shuffle!
      cards.shuffle!
    end
  end

  class Card
    SUITS = ['H', 'D', 'C', 'S'].freeze
    FACE = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].freeze
    GLYPHS = { 'H' => "\u2665", 'D' => "\u2666", 'S' => "\u2660", 'C' => "\u2663" }.freeze

    def initialize(suit, face)
      @suit, @face = suit, face
    end

    def face
      case @face
      when 'J' then 'Jack'
      when 'Q' then 'Queen'
      when 'K' then 'King'
      when 'A' then 'Ace'
      else
        @face
      end
    end

    def suit
      case @suit
      when 'H' then 'Hearts'
      when 'D' then 'Diamonds'
      when 'C' then 'Clubs'
      when 'S' then 'Spades'
      end
    end

    def value
      case @face
      when 'J' then 10
      when 'Q' then 10
      when 'K' then 10
      when 'A' then 11
      else
        @face.to_i
      end
    end

    def ace?
      @face == 'A'
    end

    def king?
      @face == 'K'
    end

    def queen?
      @face == 'Q'
    end

    def jack?
      @face == 'J'
    end

    def to_s
      "#{face} of #{suit}"
    end

    def icon
      GLYPHS[@suit]
    end
  end
end
