require 'yaml'
require 'pry'

SUITS = %w[Hearts Diamonds Spades Clubs].freeze
CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 Jack King Queen Ace].freeze
TWENTY_ONE = 21.freeze

EMPTY = ''
HIT = 'h'
STAY = 's'
PLAYER = 'Player'
DEALER = 'Dealer'
DRAW = 'Draw'

LANGUAGE = 'en'
MESSAGES = YAML.load_file('21_messages.yml')



class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end

def bg_black;       "\e[40m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
def bg_green;       "\e[42m#{self}\e[0m" end
def bg_brown;       "\e[43m#{self}\e[0m" end
def bg_blue;        "\e[44m#{self}\e[0m" end
def bg_magenta;     "\e[45m#{self}\e[0m" end
def bg_cyan;        "\e[46m#{self}\e[0m" end
def bg_gray;        "\e[47m#{self}\e[0m" end

def bold;           "\e[1m#{self}\e[22m" end
def italic;         "\e[3m#{self}\e[23m" end
def underline;      "\e[4m#{self}\e[24m" end
def blink;          "\e[5m#{self}\e[25m" end
def reverse_color;  "\e[7m#{self}\e[27m" end
end

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def initialize_deck(suits, values)
  suits.product(values).shuffle!
end

def calculate_cards(hand)
  sum = 0
  hand.each do |card|
    value = card[1]
    case value
      when ("2".."10")
        sum += value.to_i
      when /King|Queen|Jack/
        sum += 10
    end
  end
  sum = calculate_aces(hand, sum)
  sum
end
# [["Hearts", "Ace"],["Clubs", "3"],["Diamonds", "King"],["Spades", "Ace"]]
def calculate_aces(hand, current_sum)
  hand.each do |card|
    if card.include?("Ace")
      current_sum += 11
      if current_sum > 21
        current_sum -= 10
      end
    end
  end
  current_sum
end

def display_welcome
  clear_screen
  print " \u2660 \u2665 \u2666 \u2663  "
  print messages("welcome").red
  print " \u2660 \u2665 \u2666 \u2663 "
  sleep 3
  clear_screen
end

def clear_screen
  system 'clear' or system 'cls'
end

def start_game(deck, score_card)
  player_hand = deal!(deck)
  dealer_hand = deal!(deck)

  player_stash = {}
  player_stash[PLAYER] = player_hand
  player_stash[DEALER] = dealer_hand

  display_hands(player_stash)
  track_score!(score_card, player_stash)

  loop do
    break if game_over?(player_hand) || game_over?(dealer_hand)
    response = request_user_hit_or_stay
    if response == HIT
      player_hand << deal!(deck, 1).fetch(0)
      track_score!(score_card, player_stash)
      clear_screen
      display_hands(player_stash)
      break if game_over?(player_hand)
    end
    break if response.downcase == STAY
  end

  loop do
    break if game_over?(player_hand) || game_over?(dealer_hand)
    if calculate_cards(dealer_hand) < 17
      dealer_hand << deal!(deck, 1).fetch(0)
      track_score!(score_card, player_stash)
      clear_screen
      display_hands(player_stash)
      break if game_over?(dealer_hand)
      sleep 3
    else
      break
   end
  end

  score_card[:draw] = DRAW if draw?(player_hand, dealer_hand)
  game_result = get_results(score_card)

  if game_result.empty?
    score_card[:winner] = get_winner(player_hand, dealer_hand)
    game_result = get_results(score_card)
  end
  display_scores(player_stash)
  announce_game_status(game_result[0].upcase, game_result[1].to_s.capitalize)
  sleep 3
end

def display_scores(hand_stash)
  print "Score: "
  hand_stash.each do | key, value |
    print "Player: #{calculate_cards(value)} " if key == PLAYER
    puts " Dealer: #{calculate_cards(value)}" if key == DEALER
  end
end


def get_results(score_card)
  result =
  score_card.select do | key, value |
    value != EMPTY
  end.flatten
  result
end

def track_score!(score_card, hand_stash)
  hand_stash.each do | key, hand|
    if game_over?(hand)
      score_card[check_game_status(hand).to_sym.downcase] = key
    end
  end
  score_card
end

def display_hands(stash)
  stash.each do | key, value |
    display_dealer_hand(value, modified = true) if key == DEALER
    display_player_hand(value) if key == PLAYER
  end
end

def announce_game_status(game_status, player)
  if game_status == :BUSTED
    puts "#{player} busted!".red
  end
  if game_status == :WINNER
    puts "#{player} won!".green
  end
  if game_status == :DRAW
    puts "It's a draw!".cyan
  end
end

def check_game_status(hand)
  if twenty_one?(hand)
    return :WINNER
  elsif busted?(hand)
    return :BUSTED
  end
  nil
end

def game_over?(hand)
  check_game_status(hand) == :WINNER ||
  check_game_status(hand) == :BUSTED
end

def compare_hands(hand_a, hand_b)
  result = 0
  if calculate_cards(hand_a) > calculate_cards(hand_b )
    result = 2
  elsif calculate_cards(hand_a) < calculate_cards(hand_b )
    result = -1
  elsif calculate_cards(hand_a) == calculate_cards(hand_b )
     # they are equal
  end
  result
end

def twenty_one?(hand)
    calculate_cards(hand) == TWENTY_ONE
end

def busted?(hand)
  calculate_cards(hand) > TWENTY_ONE
end

def draw?(hand_a, hand_b)
  compare_hands(hand_a, hand_b) == 0
end

def get_winner(hand_a, hand_b)
  return PLAYER if compare_hands(hand_a, hand_b) == 2
  return DEALER if compare_hands(hand_a, hand_b) == -1
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
    puts sprintf("%20s", "#{card[1]} of #{card[0]}")
  end
  puts
  puts  sprintf("%18s", "Total: #{calculate_cards(hand)}") if player != 'Dealer'
  puts
end

def request_user_hit_or_stay
  input = ''
  loop do
    puts messages("hit_or_stay")
    input = gets.chomp
    break unless !['h', 's'].include?(input.downcase)
    puts messages("invalid_hit_stay")
  end
  input
end



loop do
  deck = initialize_deck(SUITS, CARD_VALUES)
  score_card = {busted: EMPTY, winner: EMPTY, draw: EMPTY}
  display_welcome
  start_game(deck, score_card)

  puts messages("play_again")
  input = gets.chomp
  break unless input.downcase.start_with?('y')
end

puts messages("thanks_for_playing")
