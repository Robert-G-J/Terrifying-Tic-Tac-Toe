require 'game'

describe Game do
                                      
  let(:human) { double(:human) }
  let(:board) { double(:board) }
  subject(:game) { described_class.new(board) }
  
  describe '#initialize' do
    it 'has a board' do
      expect(game.board).to eq board
    end
  end

  describe '#play' do
    it { is_expected.to respond_to(:play).with(1).argument }

    it 'places a token on a field' do
      game.play('X')
      expect(game.cell).to eq('X')
    end

    it 'raises an exception if the field is occupied' do
      game.play('X')
      expect { game.play('O') }.to raise_exception('Cell Occupied')
    end

  end
end
