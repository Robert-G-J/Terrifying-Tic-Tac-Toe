require 'game'

describe Game do
  subject(:game) { described_class.new }
  
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
