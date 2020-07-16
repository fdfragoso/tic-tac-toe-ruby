require_relative 'board.rb'
class Game
  WIN_CONDITION = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze

  obj_board = Board.new
  # board = obj_board.get_board
  obj_board.board

  # define the turn - checks what happens in each turn
  def turn(user_input, board, obj_board)
    index = obj_board.input_to_index(user_input)
    # rubocop: disable Style/GuardClause
    if obj_board.valid_move?(board, index)
      obj_board.move(board, index, current_player(board))
    else
      return ['Not a valid move!!! Try again']
    end
    board
    # rubocop: enable Style/GuardClause
  end

  # KEEP TRACK OF THE TURNS
  def count_turns(board)
    counter = 0
    board.each do |spaces| 
      counter += 1 if spaces.to_s.include?('X') || spaces.to_s.include?('O')
    end
    counter
  end

  # winning condition
  def won?(board)
    comb = []
    WIN_CONDITION.each do |win_comb|
      comb = [board[win_comb[0]], board[win_comb[1]], board[win_comb[2]]]
      return true if comb.all? { |x| x == 'O' }
      return true if comb.all? { |x| x == 'X' }
    end
    false
  end

  # Checks who won the game X or O
  def who_won(board)
    comb = []
    WIN_CONDITION.each do |win_comb|
      comb = [board[win_comb[0]], board[win_comb[1]], board[win_comb[2]]]
      return 'O' if comb.all? { |x| x == 'O' }
      return 'X' if comb.all? { |x| x == 'X' }
    end
  end

  # check if it is game over
  def game_over?(board, obj_board)
    return true if draw?(board, obj_board) || won?(board) || obj_board.full?(board)
  end

  # check if there is a winner
  def winner(board)
    return who_won(board) if won?(board)
  end

  # DEFINE THE CURRENT PLAYER
  def current_player(board)
    puts count_turns(board)
    count_turns(board).even? ? 'X' : 'O'
  end

  # returns if is a draw
  def draw?(board, obj_board)
    if !won?(board) && obj_board.full?(board)
      true
    elsif !won?(board) && !obj_board.full?(board)
      false
    elsif won?(board)
      false
    end
  end
end
