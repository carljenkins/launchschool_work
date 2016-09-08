#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'deck'
require_relative 'player'
module TwentyOne
  class Game

    TWENTY_ONE = 21

    attr_accessor :deck, :dealer, :player

    def initialize
      @deck = TwentyOne::Deck.new
      @dealer = TwentyOne::Dealer.new
      @player = TwentyOne::Player.new
    end

    def clear_screen
      system 'clear'
    end

    def show_cards
      clear_screen
      puts format("%20s", "Current Hands")
      puts '   ---------------------'
      puts format("%1s", "Dealer:")
      puts format("%-40s", dealer.reveal)
      puts format("%1s", "Total:  #{dealer.total if !dealer.hide_card}")
      puts
      puts format("%1s", "Player:")
      puts format("%-40s", player.reveal)
      puts format("%1s", "Total:  #{player.total}")
    end

    def deal_cards
      dealer.shuffle!(deck)
      2.times do
       player << dealer.deal(deck)
       dealer << dealer.deal(deck)
      end
    end

    def play(options)
    	deal_cards
      show_cards
      
      # player_turn
      # dealer_turn
      # show_result

    end



  end


end
