require_relative '../bin/main.rb'
require_relative '../lib/game.rb'

describe Game do
  let(:board) { [1, 2, 3, 'X', 'O', 6, 'X', 'O', 9] }
  let(:board2) { [1, 2, 3, 4, 'X', 6, 'X', 'O', 9] }
  let(:board3) { [1, 2, 3, 4, 'X', 6, 7, 8, 9] }

  let(:win) { ['X', 'X', 'X', 4, 'O', 6, 'X', 'O', 9] }
  let(:win2) { %w[X O X O X X O X O] }
  let(:win3) { ['O', 'O', 'O', 4, 'O', 6, 'X', 'O', 9] }

  obj_game = Game.new
  obj_board = Board.new

  describe '#count_turns' do
    it 'returns the turn count based on how many X and O is found on the board array' do
      expect(obj_game.count_turns(board2)).to eq 3
    end
  end

  describe '#won?' do
    it 'Return true based on any win condition' do
      expect(obj_game.won?(win)).to be true
    end

    it 'Return false if there is no winner' do
      expect(obj_game.won?(win2)).to be false
    end
  end

  describe '#who_won' do
    it 'Return X if X won' do
      expect(obj_game.who_won(win)).to eq('X')
    end

    it 'Return O if O won ' do
      expect(obj_game.who_won(win3)).to eq('O')
    end
  end

  describe '#winner' do
    it 'Return who exactly won' do
      expect(obj_game.winner(win)).to eq('X')
    end

    it 'Return O if O won ' do
      expect(obj_game.winner(win3)).to eq('O')
    end
  end

  describe '#current_player' do
    it 'Return X if X is the current player' do
      expect(obj_game.current_player(board)).to eq('X')
    end

    it 'Return O if O is the current player' do
      expect(obj_game.current_player(board3)).to eq('O')
    end
  end

  describe '#game_over' do
    it 'Return true if is game over' do
      expect(obj_game.game_over?(win2, obj_board)).to be true
    end

    it 'Return nil if is not game over' do
      expect(obj_game.game_over?(board, obj_board)).to be nil
    end
  end

  describe '#draw?' do
    it 'Return true if is draw' do
      expect(obj_game.draw?(win2, obj_board)).to be true
    end

    it 'Return false if there is a winner' do
      expect(obj_game.draw?(win, obj_board)).to be false
    end

    it 'Return false if there is no winner and the board isnt full' do
      expect(obj_game.draw?(board, obj_board)).to be false
    end
  end
end

describe Board do
  let(:board) { [1, 2, 3, 'X', 'O', 6, 'X', 'O', 9] }
  let(:move) { ['X', 2, 3, 'X', 'O', 6, 'X', 'O', 9] }
  let(:win2) { %w[X O X O X X O X O] }

  obj_board = Board.new

  describe '#valid_move' do
    it 'Return true if index is between 0 and 8 and position is not taken' do
      expect(obj_board.valid_move?(board, 8)).to be true
    end

    it 'Return nil if index is not between 0 and 8' do
      expect(obj_board.valid_move?(board, 10)).to be nil
    end

    it 'Return nil if position is taken' do
      expect(obj_board.valid_move?(board, 3)).to be nil
    end
  end

  describe '#position_taken' do
    it 'Return false if the position is not take' do
      expect(obj_board.position_taken?(board, 8)).to be false
    end

    it 'Return true if the position is taken' do
      expect(obj_board.position_taken?(board, 7)).to be true
    end
  end

  describe '#input_to_index' do
    it 'Return the move index is between 0-8' do
      expect(obj_board.input_to_index(2)).to eq(1)
    end
  end

  describe '#full?' do
    it 'Return true if the board is full and without a winner' do
      expect(obj_board.full?(win2)).to be true
    end
  end

  describe '#move?' do
    it 'Make the move' do
      expect(obj_board.move(board, 0, 'X')).to eq('X')
    end
  end
end
