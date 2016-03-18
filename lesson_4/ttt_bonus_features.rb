require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
    [[1, 5, 9], [3, 5, 7]].freeze

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=>" + msg
end

def joinor(arr, sep = ', ', orclause='or ')
  (arr * sep).insert(-2, orclause)
end

def display_score(scores)
  puts "  == Current Score==\nYou: #{scores[:player]}       Computer: #{scores[:computer]}"
  puts
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear' or system 'cls'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]} "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end

# rubocop:enable Metrics/AbcSize
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def find_empty_board_position(brd, pos)
  brd.select do |key, value|
    [pos].include?(key) && value == INITIAL_MARKER
  end.key(INITIAL_MARKER)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_marker!(brd, scores)
  loop do
    display_board(brd)
    display_score(scores)
    if current_player?(brd) == :player
      player_places_piece!(brd)
    else
      sleep 3 #thinking....
      computer_places_piece!(brd)
    end
    break if end_of_round?(brd)
  end
end

def current_player?(brd)
  brd.values.count(" ").odd? ? :player : :computer
end

def end_of_round?(brd)
  someone_won?(brd) || board_full?(brd)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  next_move = computer_anticipate_next_move(brd)
  if !brd.has_key?(next_move)
    square_5 = find_empty_board_position(brd, 5)
    if square_5
      square = square_5
    else
      square = empty_squares(brd).sample
    end
  else
    square = next_move
  end
  brd[square] = COMPUTER_MARKER
end

def get_anticipated_move(spaces, brd)
  hsh = brd.select { |key, value| [spaces[0], spaces[1], spaces[2]].include?(key) }
  hsh.key(INITIAL_MARKER)
end

def find_offensive_move(brd)
  calculate_move(brd, COMPUTER_MARKER)
end

def find_defensive_move(brd)
  calculate_move(brd, PLAYER_MARKER)
end

def calculate_move(brd, marker)
  move = nil
  WINNING_LINES.each do |spaces|
    if brd.values_at(*spaces).count(marker) == 2
      move = get_anticipated_move(spaces, brd)
    end
  end
  move
end

def computer_anticipate_next_move(brd)
  next_move = find_offensive_move(brd)
  return next_move if !!next_move

  next_move = find_defensive_move(brd)
  return next_move if !!next_move

end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def get_winner(scores)
  scores.key(5).to_s.capitalize
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return :player
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return :computer
    end
  end
  nil
end

def request_new_game
  prompt "Play again? (y or n)"
  answer = gets.chomp
end

def score_limit_reached?(scores)
  scores.value?(5)
end

def update_score!(scores, brd)
  if detect_winner(brd) == :player
    scores[:player] += 1
  elsif detect_winner(brd) == :computer
    scores[:computer] += 1
  else
    scores[:draw] += 1
  end

end

scores = {player: 0, computer: 0, draw: 0}

loop do

  loop do
    board = initialize_board

    place_marker!(board, scores)
    update_score!(scores, board)
    display_board(board)

    break if score_limit_reached?(scores)
    display_board(board) if !score_limit_reached?(scores)
    display_score(scores) if !score_limit_reached?(scores)
  end

  prompt "#{get_winner(scores)} won!"
  break unless request_new_game.downcase.start_with?('y')

  prompt "Starting next round..."
  sleep 4

end

prompt "Thanks for playing Tic Tac Toe! See ya."
