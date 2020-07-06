class Board
  attr_accessor :board

  def initialize
    @board = (1..9).to_a
  end

  # VALIDATE THE MOVE
  def valid_move?(board, index)
    # THE PLAYER INPUT IS BETWEEN 0 AND 8 AND THE POSITION IS NOT TAKEN
    return true if index.between?(0, 8) && !position_taken?(board, index)
  end

  # USER MOVEMENT - X or O to a certain position
  def move(board, index, player)
    board[index] = player
  end

  # THE POSITION IS ALREADY TAKEN
  def position_taken?(board, index)
    if ((board[index]).is_a? Integer) || board[index].nil?
      false
    else
      true
    end
  end

  # USER INPUT TO THE ARRAY POSITION
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # Draw - board is full and without a winner
  def full?(board)
    board.all? { |i| i.to_s.include?('X') || i.to_s.include?('O') }
  end
end
