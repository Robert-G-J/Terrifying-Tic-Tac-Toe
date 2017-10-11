require 'board'

describe Board do
  subject(:board) { described_class.new }

  describe '#occupied' do
    before do
      board.state = ['X']
    end

    context 'true'  do
      it 'is occupied by a token' do
        expect(board.occupied?(0)).to be true
      end
    end

    context 'false' do
      it 'has no token' do
        board.state = []
        expect(board.occupied?(0)).to be false
      end
    end
  end

  describe '#game_over?' do
    context 'true' do
      xit 'is a tie' do
        board.state = ['X', 'O', 'X',
                       'O', 'X', 'O',
                       'X', 'O', 'X']
        expect(board.game_over?).to be true
      end

      it 'is won by row' do
        board.state = ['X', 'X', 'X', 
                       'O', nil, nil,
                       nil, 'O', nil]
        expect(board.game_over?).to be true
      end
 
      it 'is won by column' do
        board.state = ['X', 'O', nil, 
                       'X', nil, nil,
                       'X', 'O', nil]
        expect(board.game_over?).to be true
      end

      it 'is won by first diagonal' do
        board.state = ['X', 'O', nil, 
                       nil, 'X', nil,
                       nil, 'O', 'X']
        expect(board.game_over?).to be true
      end

      it 'is won by second diagonal' do
        board.state = [nil, 'O', 'X', 
                       nil, 'X', nil,
                       'X', 'O', nil]
        expect(board.game_over?).to be true
      end
    end
  end
end
