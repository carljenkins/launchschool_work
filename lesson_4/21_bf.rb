require 'yaml'
require 'pry'

SUITS = %w(Hearts Diamonds Spades Clubs).freeze
CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 Jack King Queen Ace).freeze
GLYPHS = ["\u2665", "\u2666", "\u2660", "\u2663"].freeze
SPADE = "\u2660"
HEART = "\u2665"
DIAMOND = "\u2666"
CLUB = "\u2663"
GAME_LIMIT = 21
DEALER_LIMIT = 17
EMPTY = ''
HIT = 'h'
STAY = 's'
PLAYER = 'Player'
DEALER = 'Dealer'
DRAW = 'Draw'

LANGUAGE = 'en'.freeze
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
end

def calculate_aces(hand, current_sum)
  hand.each do |card|
    if card.include?("Ace")
      current_sum += 11
      if current_sum > GAME_LIMIT
        current_sum -= 10
      end
    else
      next
    end
  end
  current_sum
end

def display_welcome
  clear_screen
  print " #{SPADE} #{HEART} #{DIAMOND} #{CLUB} "
  print messages("welcome").red
  print " #{SPADE} #{HEART} #{DIAMOND} #{CLUB} "
  sleep 3
  clear_screen
end

def clear_screen
  system 'clear'
end

def handle_player_turn(deck, player_stash)
  player_hand = player_stash[PLAYER]
  loop do
    response = request_user_hit_or_stay
    if response == HIT
      player_hand << deal!(deck, 1).fetch(0)
      clear_screen
      display_hands(player_stash, modified_hand = true)
    end
    break if response.downcase == STAY || busted?(player_hand)
  end
end

def handle_dealer_turn(deck, player_stash)
  dealer_hand = player_stash[DEALER]
  player_hand = player_stash[PLAYER]
  loop do
    break if busted?(player_hand) || busted?(dealer_hand)
    if calculate_cards(dealer_hand) < DEALER_LIMIT
      dealer_hand << deal!(deck, 1).fetch(0)
      clear_screen
      display_hands(player_stash, modified_hand = false)
      sleep 1
      break if busted?(dealer_hand)
    else
      break
    end
  end
end

def play_game(deck, score_card, round_score)
  player_hand = deal!(deck)
  dealer_hand = deal!(deck)

  player_stash = {}
  player_stash[PLAYER] = player_hand
  player_stash[DEALER] = dealer_hand
  display_hands(player_stash, modified_hand = true)

  if !busted?(player_hand) || !busted(dealer_hand)
    handle_player_turn(deck, player_stash)
    handle_dealer_turn(deck, player_stash)
  end
  display_round_info(player_stash)
  update_score_card(score_card, player_stash, round_score)
  game_result = get_results(score_card)
  announce_game_status(game_result[0].upcase, game_result[1].to_s.capitalize)
  sleep 3
end

def display_round_info(stash)
  clear_screen
  display_hands(stash, modified_hand = false)
  display_scores(stash)
end

def update_score_card(score_card, player_stash, round_score)
  player_hand = player_stash[PLAYER]
  dealer_hand = player_stash[DEALER]
  if draw?(player_hand, dealer_hand)
    score_card[:draw] = DRAW
    round_score[:draws] += 1
  elsif busted?(dealer_hand)
    score_card[:busted] = DEALER
    round_score[:player] += 1
  elsif busted?(player_hand)
    score_card[:busted] = PLAYER
    round_score[:dealer] += 1
  end
  if score_card.values.count(EMPTY) == 3
    score_card[:winner] = get_winner(player_hand, dealer_hand)
    round_score[:dealer] +=1 if score_card[:winner] == DEALER
    round_score[:player] +=1 if score_card[:winner] == PLAYER
  end
end

def display_scores(hand_stash)
  print "Hand totals: "
  print "Player: #{calculate_cards(hand_stash[PLAYER])} "
  puts " Dealer: #{calculate_cards(hand_stash[DEALER])}"
end

def get_results(score_card)
  score_card.select do |_, value|
    value != EMPTY
  end.flatten
end

def display_hands(stash, modified)
  stash.each do |key, value|
    display_dealer_hand(value, modified) if key == DEALER
    display_player_hand(value) if key == PLAYER
  end
end

def announce_game_status(game_status, player)
  case game_status
  when :BUSTED
    puts "#{player} #{messages('game_end_busted')}".red
  when :WINNER
    puts "#{player} #{messages('game_end_won')}".green
  when :DRAW
    puts messages("game_end_draw").cyan
  end
end

def compare_hands(hand_a, hand_b)
  calculate_cards(hand_a) <=> calculate_cards(hand_b)
end

def busted?(hand)
  calculate_cards(hand) > GAME_LIMIT
end

def draw?(hand_a, hand_b)
  compare_hands(hand_a, hand_b) == 0
end

def get_winner(hand_a, hand_b)
  return PLAYER if compare_hands(hand_a, hand_b) == 1
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

def get_glyph(type)
  return type if type == 'x'
  GLYPHS[SUITS.index(type)]
end

def display_hand(hand, player)
  puts format("%20s", "#{player} Hand")
  puts '     ---------------------'
  hand.each do |card|
    puts format("%20s", "#{card[1]} of #{get_glyph(card[0])}'s")
  end
  puts
  puts format("%18s", "Total: #{calculate_cards(hand)}") if player != 'Dealer'
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

def play_again?
  input = ''
  loop do
    puts messages("play_again")
    input = gets.chomp
    return input if ['y', 'n'].include?(input)
    puts messages("incorrect_quit_command")
  end
end

def start_next_round
  puts "Starting next round..."
  sleep 5
end

def display_round_scores(scores)
  puts "    == Round Scores==   "
  puts "You: #{scores[:player]} Dealer: #{scores[:dealer]} Draws: #{scores[:draws]}"
  puts
end

def score_limit_reached(round_score)
  round_score.value?(5)
end

# Main game loop
loop do
  round_score = { player: 0, dealer: 0, draws: 0 }
  loop do
    deck = initialize_deck(SUITS, CARD_VALUES)
    score_card = { busted: EMPTY, winner: EMPTY, draw: EMPTY }
    display_welcome
    play_game(deck, score_card, round_score)

    break if score_limit_reached(round_score)
    clear_screen
    display_round_scores(round_score)
    start_next_round
  end
    display_round_scores(round_score)
    break if play_again? == 'n'
end
puts messages("thanks_for_playing")
