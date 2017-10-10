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
  end
end
