#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'deck'
module TwentyOne
  class Participant
    attr_accessor :cards, :hide_card, :total

    def initialize
      @cards = []
    end

    def <<(card)
      current_cards = cards.push card
      calculate_cards
      current_cards
    end

    def reveal
      display = ''
      cards.each.with_index do |card, idx|
        if hide_card && idx == 1
          display += ' XXXX'
        else
          display += " #{card.face} of #{card.icon}'s\n"
        end
      end
      display
    end

    def busted?
      total > TwentyOne::Game::TWENTY_ONE
    end

    def has_twentyone?
      total == TwentyOne::Game::TWENTY_ONE
    end

    private

    def calculate_cards
      sum = 0
      cards.each do |card|
        sum += card.value
      end
      sum = adjust_for_aces(sum)
      self.total = sum
    end

    def adjust_for_aces(sum)
      cards.each do |card|
        if sum > TwentyOne::Game::TWENTY_ONE && card.ace?
          sum -= 10
        end
      end
      sum
    end

    protected

    attr_writer :total
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

    def stays?
      total >= TwentyOne::Game::DEALER_STAYS
    end
  end
end
