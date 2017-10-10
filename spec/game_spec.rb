require 'game'

describe Game do
                                      
  let(:human) { double(:human) }
  let(:board) { double(:board, :occupied? => true) }
  subject(:game) { described_class.new(board) }
  
  describe '#initialize' do
    it 'has a board' do
      expect(game.board).to eq board
    end
  end

  describe '#play' do
    it { is_expected.to respond_to(:play).with(2).arguments }

    it 'places a token on a field' do
      game.play('X', 0)
      board = game.board
      expect(board.occupied?(0)).to be true
    end

    it 'raises an exception if the field is occupied' do
      game.play('X', 0)
      expect { game.play('O', 0) }.to raise_exception('Cell Occupied')
    end

  end
end
