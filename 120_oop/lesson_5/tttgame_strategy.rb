
require_relative 'square'
require_relative 'board'

module TTTGameStrategy

  def find_defensive_move(board)
    marker = determine_opponents_marker(board)
    move = nil
    if marker
		  move = 
		    find_empty_square_position(board, marker)
		end
		move
  end

  private 

  def find_empty_square_position(board, marker)
  	square = nil
    Board::WINNING_LINES.each do |line|
  	  if count_squares(board, marker, line) == 2
  	    square = 
  	      board.squares.select do |k, v|   
  	        line.include?(k) && v.marker == Square::INITIAL_MARKER 
  	      end.keys.first
  	  end
    end
    square
  end

  def determine_opponents_marker(board)
  	squares =
  	  board.squares.values.select do | v |
  	    Square::MARKERS.include?(v.marker)
  	  end
  	  return squares.first.marker if !squares.empty?
  end

  def count_squares(board, m, lines)
    board.squares.values_at(*lines).count { |s| s.marker == m }
  end
end