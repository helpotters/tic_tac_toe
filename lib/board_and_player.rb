# frozen_string_literal: true

# Create Game Objects
module BoardAndPlayer
  # Game Objects
  # Manages the occupancy of a grid
  class Grid
    attr_reader :grid
    def initialize(size)
      # N by N square grid
      @grid = Array.new(size) { Array.new(size) }
    end

    private

    def rows(grid)
      # added for completion
      grid
    end

    def columns(grid)
      # Flip columns into rows
      grid.transpose
    end

    def diagonals(grid)
      # Returns values of nth column for nth row.
      forward_diagonal = grid.each_with_index.map { |row, index| row[index] }
      reverse_diagonal = grid.transpose.each_with_index.map { |column, index| column[index] }

      [forward_diagonal, reverse_diagonal]
    end

    public

    def change_value(values, marker)
      row = values[0]
      column = values[1]
      @grid[row][column] = marker
    end

    def every_line
      [rows(grid), columns(grid), diagonals(grid)]
    end
  end

  # Create player objects
  class Player
    @@players = 0

    attr_reader :marker, :name
    def initialize
      @@players += 1
      @name = 'Player' + @@players.to_s
      @marker =
              if @@players.odd?
                'X'
              elsif @@players.even?
                'O'
              end
    end
  end
end
