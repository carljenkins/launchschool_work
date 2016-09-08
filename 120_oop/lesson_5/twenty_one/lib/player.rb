#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'deck'
module TwentyOne

  class Participant
    attr_accessor :cards, :hide_card

    def initialize
      @cards = []
    end

    def <<(card)
      cards.push card
    end

    def reveal
      display = ""
      cards.each.with_index do |card, idx|
        if hide_card && idx == 1
          display += "  XXXX"
        else
          display += "  #{card.face} of #{card.icon}'s   #{"\n" if idx == 0}"
        end
      end
      display
    end

    def total
      sum = 0
      cards.each do |card|
        sum += card.value
      end
      sum = adjust_for_aces(sum)
    end

    private

    def adjust_for_aces(sum)
      cards.each do |card|
        if sum > Game::TWENTY_ONE && card.ace?
          sum -= 10
        end
      end
      sum
    end

  	# def hit
    #
  	# end
    #
    #
  	# def stay
    #
  	# end
    #
    #
  	# def busted?
    #
  	# end
    #

  end


  class Player < Participant


  end


  class Dealer < Participant
    def initialize
      super
      self.hide_card = true
    end

  	def deal(deck)
  	  deck.pop
  	end

    def shuffle!(deck)
      deck.shuffle!
    end

  end
end
