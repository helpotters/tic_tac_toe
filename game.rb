# frozen_string_literal: true

require './board_and_player.rb'
require './moves.rb'

# Game Controller
class Game
  include BoardAndPlayer
  include TicTacToe
  attr_accessor :board
  def initialize(board_size, players)
    @board = Grid.new(board_size)
    @players = players
  end

  def play
    turns = 0
    loop do
      turns += 1
      # Odd or Even Player's turn
      player = TicTacToe.next_turn(turns, @players)
      row_column = TicTacToe.choose_value(@board.grid, player.marker)
      @board.change_value(row_column, player.marker)
      break if end_game(@board, player)
    end
  end

  private

  def end_game(board, player)
    board.every_line.each.any? do |line|
      return win(player.name) if TicTacToe.three_in_a_row?(line, player.marker)
      return draw if TicTacToe.draw?(line)

      false # else, no wins or draws
    end
  end

  def win(player)
    p "#{player} has won!"
  end

  def cats_game
    p 'Game was a draw.'
  end
end

# Player Starts Game
loop do
  p 'Would you like to start? Y/N'
  play_game = gets.chomp.downcase
  break unless play_game == 'y'

  players = [BoardAndPlayer::Player.new, BoardAndPlayer::Player.new] # 2 Players
  new_game = Game.new(3, players) # 3x3 grid
  new_game.play # Start
end
