require 'pry'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

INITIAL_MARKER  = ' '.freeze
PLAYER_MARKER   = 'X'.freeze
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
  system 'clear'
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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
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
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
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
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
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

def update_score(scores, brd)
  key = detect_winner(brd)
  scores[key.downcase.to_sym] += 1 if key
end

scores = {player: 0, computer: 0}

loop do
  board = initialize_board

  loop do
    display_board(board)
    display_score(scores)

    player_places_piece!(board)
    update_score(scores, board) if someone_won?(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    update_score(scores, board) if someone_won?(board)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
  display_score(scores)


  if score_limit_reached?(scores)
    prompt "#{get_winner(scores)} won!"
    break unless request_new_game.downcase.start_with?('y')
  else
    prompt "Starting next round..."
    sleep 3
  end

end

prompt "Thanks for playing Tic Tac Toe! See ya."
