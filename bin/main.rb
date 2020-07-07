#!/usr/bin/env ruby
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'

obj_game = Game.new
obj_board = Board.new

board = obj_board.board

# DISPLAY THE BOARD
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# initial instructions for player
display_board(board)

until obj_game.game_over?(board, obj_board)
  # loop for each move
  puts 'Type 1 to 9'
  user_input = gets.strip

  puts display_board(obj_game.turn(user_input, board, obj_board))

  if obj_game.won?(board)
    obj_game.winner(board) == 'X' || obj_game.winner(board) == 'O'
    puts "Congrats! #{obj_game.winner(board)}"
    # game_on = false
  elsif obj_game.draw?(board, obj_board)
    puts 'Draw!'
  end
end
