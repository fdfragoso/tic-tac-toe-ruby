require_relative '../bin/main.rb'
require_relative '../lib/game.rb'

describe Game do
  let(:board) { [1, 2, 3, 'X', 'O', 6, 'X', 'O', 9] }
  let(:board2) { [1, 2, 3, 4, 'O', 6, 'X', 'O', 9] }
  let(:win) { ['X', 'X', 'X', 4, 'O', 6, 'X', 'O', 9] }
  let(:win2) { ['X', 'O', 'X', 'O', 'X', 'X', 'O', 'X', 'O'] }
  let(:win3) { ['O', 'O', 'O', 4, 'O', 6, 'X', 'O', 9] }
  obj_game = Game.new
  
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
end 
  