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

# define the player - our game loop
def player(board)
  turn(board) until game_over?(board)
  if won?(board)
    winner(board) == 'X' || winner(board) == 'O'
    puts "Congrats! #{winner(board)}"
  elsif draw?(board)
    puts 'Draw'
  end
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
def game_over?(board)
  return true if draw?(board) || won?(board) || full?(board)
end

# check if there is a winner
def winner(board)
  return who_won(board) if won?(board)
end

# DEFINE THE CURRENT PLAYER
def current_player(board)
    count_turns(board).even? ? 'X' : 'O'
  end
  
# define the turn - checks what happens in each turn
def turn(board)
  puts 'Type 1 to 9: '
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    puts 'Not a valid move!!! Try again'
  end
  display_board(board)
end

# returns if is a draw
def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
    false
  end
end