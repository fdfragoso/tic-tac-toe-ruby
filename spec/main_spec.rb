require_relative '../bin/main.rb'
require_relative '../lib/game.rb'

describe Game do
  let(:board) { [1, 2, 3, 'X', 'O', 6, 'X', 'O', 9] }
  let(:board2) { [1, 2, 3, 4, 'X', 6, 'X', 'O', 9] }
  let(:board3) { [1, 2, 3, 4, 'X', 6, 7, 8, 9] }

  let(:win) { ['X', 'X', 'X', 4, 'O', 6, 'X', 'O', 9] }
  let(:win2) { ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O'] }
  let(:win3) { ['O', 'O', 'O', 4, 'O', 6, 'X', 'O', 9] }
  
  obj_game = Game.new
  obj_board = Board.new
  
  describe '#count_turns' do
    it 'returns the turn count based on how many X and O is found on the board array' do
      expect( obj_game.count_turns(board2) ).to eq 3
    end
  end

  describe '#won?' do
    it 'Return true based on any win condition' do
      expect( obj_game.won?(win) ).to be true
    end

    it 'Return false if there is no winner' do
      expect( obj_game.won?(win2) ).to be false
    end
  end

  describe '#who_won' do
    it 'Return X if X won' do
      expect( obj_game.who_won(win) ).to eq('X')
    end

    it 'Return O if O won ' do
      expect( obj_game.who_won(win3) ).to eq('O')
    end
  end

  describe '#winner' do
    it 'Return who exactly won' do
      expect( obj_game.winner(win) ).to eq('X')
    end

    it 'Return O if O won ' do
      expect( obj_game.winner(win3) ).to eq('O')
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
  