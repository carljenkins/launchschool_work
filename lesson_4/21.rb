require 'yaml'
require 'pry'

SUITS = %w[Hearts, Diamonds, Spades, Clubs].freeze
CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 Jack King Queen Ace].freeze

LANGUAGE = 'en'
MESSAGES = YAML.load_file('21_messages.yml')


# ["Spades", "Ace"]
# ["Hearts", "Jack"]
# ["Spades", "King"]
#win, bust, lose
#return a integer value
def calculate_cards(hand)
 sum = 0
  hand.each do |card|
    suit = card[0]
    value = card[1]
    case value
    when ("2".."10").include?(value)
      sum += value.to_i
    when %w[Jack Queen King].include?(value)
      sum += 10
      else
        0
    end
  end
  sum
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def initialize_deck(suits, values)
  suits.product(values).shuffle!
end

def display_welcome
  puts messages("welcome")
  sleep 1
  system 'clear' or system 'cls'
end

def deal_cards(deck)
  player_hand = deal!(deck)
  dealer_hand = deal!(deck)

  display_player_hand(player_hand)
  display_dealer_hand(dealer_hand, masked = true)


  loop do
    response = request_user_hit_or_stay
    if response == 'h'
      # add a card to players hand
      player_hand << deal!(deck, 1).fetch(0)

      calculate_cards(player_hand)
      display_player_hand(player_hand)
      display_dealer_hand(dealer_hand)
    end
    break if response.downcase == 's' || busted?(player_hand)
  end

    # dealer_hand << deal!(deck, 1).fetch(0)

end

def busted?(hand)

  calculate_cards(hand) > 21
end


def deal!(deck, cards = 2)
  hand = []
  cards.times do
    hand << deck.pop
  end
  hand
end



def display_player_hand(hand)
  display_hand(hand, "Player")
end

def display_dealer_hand(hand, masked = false)
  if masked
    hand = Array.new(hand).fill('xx', 1)
  end
  display_hand(hand, "Dealer")
end

def display_hand(hand, player)
  puts sprintf("%20s", "#{player} Hand")
  puts '     ---------------------'
  hand.each do |card|
      puts sprintf("%20s","#{card[1]} of #{card[0]}")
  end
  puts sprintf("%18s", "Total: #{30}")
  puts
end

def request_user_hit_or_stay
  input = ''
  loop  do
    puts messages("hit_or_stay")
    input = gets.chomp
    break unless !['h','s'].include?(input.downcase)
    puts messages("invalid_hit_stay")
  end
  input
end


deck = initialize_deck(SUITS, CARD_VALUES)



display_welcome
deal_cards(deck)
loop do


  puts "Would you like to play again (y/n)?"
  input = gets.chomp
  break if input.downcase.start_with?('n')
  puts "Hmm. that doesn't seem right."
end

  puts "Thanks for playing!"
