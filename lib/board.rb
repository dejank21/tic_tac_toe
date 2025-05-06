# frozen_string_literal: true

# This class represents the Tic Tac Toe board and assositated methods
# It is responsible for displaying the board, updating the cells, checking for valid moves, and win conditions.

class Board
  attr_reader :cells

  def initialize
    @cells = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  # Constants for winning lines
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # Horizontal
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # Vertical
    [1, 5, 9], [3, 5, 7]             # Diagonal
  ].freeze

  # rubocop:disable Metrics/AbcSize
  def display_board
    puts "\n"
    puts " #{cells[1]} | #{cells[2]} | #{cells[3]} "
    puts '---+---+---'
    puts " #{cells[4]} | #{cells[5]} | #{cells[6]} "
    puts '---+---+---'
    puts " #{cells[7]} | #{cells[8]} | #{cells[9]} "
    puts "\n"
  end
  # rubocop:enable Metrics/AbcSize

  # Updates the cell at the given position with the symbol if the move is valid
  def update_cell(position, symbol)
    @cells[position] = symbol if valid_move?(position)
  end

  # Checks if the move is valid
  def valid_move?(input)
    position = input.to_i
    return position if position.between?(1, 9) && @cells[position] == position

    puts 'Invalid move. Please try again.'
  end

  # Checks if the board is full
  def full?
    @cells[1..9].all? { |cell| cell.is_a?(String) }
  end

  # Checks if there is a winner
  def winner?(symbol)
    WINNING_LINES.any? do |line|
      line.all? { |position| @cells[position] == symbol }
    end
  end
end
