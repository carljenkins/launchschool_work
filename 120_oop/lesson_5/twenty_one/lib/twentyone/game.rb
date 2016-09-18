#!/usr/bin/env ruby
# Copyright (c) 2016 Carl Jenkins
# frozen_string_literal: true
require_relative 'deck'
require_relative 'player'
require_relative 'messages'
module TwentyOne
  class Game
    include TwentyOne::Messages

    TWENTY_ONE = 21
    DEALER_STAYS = 17
    HIT = 'h'
    STAY = 's'

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
      puts format("%20s", hands_label('current_hands'))
      puts '   ---------------------'
      puts format("%1s", dealer_label('dealer'))
      puts format("%-40s", dealer.reveal)
      puts format("%1s", "Total:  #{dealer.total if !dealer.hide_card}")
      puts
      puts format("%1s", player_label('player'))
      puts format("%-40s", player.reveal)
      puts format("%1s", "Total:  #{player.total}")
    end

    def deal(participant)
      if participant == :PLAYER
        player << dealer.deal(deck)
      else
        dealer << dealer.deal(deck)
      end
    end

    def deal_cards
      dealer.shuffle!(deck)
      2.times do
       player << dealer.deal(deck)
       dealer << dealer.deal(deck)
      end
    end

    def game_over?
      winner? || busted?
    end

    def winner?
      dealer.has_twentyone? || player.has_twentyone?
    end

    def busted?
      dealer.busted? || player.busted?
    end

    def dealer_out?
      dealer.has_twentyone? || dealer.busted? || dealer.stays?
    end

    def request_input
      response = nil
      loop do
        messages('hit_or_stay')
        response = gets.chomp.strip.downcase
        break if [HIT, STAY].include?(response)
      end
      response
    end

    def handle_player_turn
      loop do
        break if player.busted? || request_input == STAY
          deal(:PLAYER)
          show_cards
      end
    end

    def handle_dealer_turn
      loop do
        show_cards
        break if dealer_out?
        progress_meter(messages('decision'))
        deal(:DEALER)
      end
    end
    def take_turns
      loop do
        handle_player_turn
        dealer.hide_card = false
        break if player.busted?
        handle_dealer_turn
        break if game_over? || dealer.stays?
      end
    end

    def display_winner
      if player.has_twentyone?
        messages('player_won')
      elsif dealer.has_twentyone?
        messages('dealer_won')
      elsif player.total > dealer.total
        messages('player_won')
      elsif dealer.total > player.total
        messages('dealer_won')
      end
    end

    def display_busted
      if dealer.busted?
        messages('dealer_busted')
      elsif player.busted?
        messages('player_busted')
      end
    end

    def show_result
      show_cards
      if busted?
        display_busted
      elsif dealer.total == player.total
        messages('tie')
      else
        display_winner
      end
    end

    def progress_meter(msg)
      print msg
      20.times do
        print '.'
        sleep(0.07)
      end
      puts
    end

    def play(options)
    	deal_cards
      show_cards
      take_turns
      show_result
    end
  end
end
