# frozen_string_literal: true

# Main game functions
module TicTacToe
  class << self
    def choose_value(board, marker)
      print_board(board)
      take_input
    end

    private

    # Game Functions
    def print_board(board)
      board.each { |value| p value} 
    end

    # TODO: add rescue, overwriting is still possible?
    def take_input
      p 'Which row?'
      row = gets.chomp.to_i
      p 'Which column?'
      column = gets.chomp.to_i
      [row, column]
    end

    public

    # TODO: shorten??
    def next_turn(turns, players)
      if turns.odd?
        players[0]
      elsif turns.even?
        players[1]
      end
    end

    def three_in_a_row?(matrix, value)
      matrix.each.any? do |row|
        row.each.all? { |check| check == value }
      end
    end

    def draw?(matrix)
      matrix.each.all? { |value| value.nil? }
    end
  end
end
