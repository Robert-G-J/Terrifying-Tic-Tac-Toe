require 'game_constructor'

describe GameConstructor do
  subject(:gc) { described_class.new(ui: ui) }
  let(:ui) { double(:ui) }
  
  describe 'starting a new game' do
    it { is_expected.to respond_to :new_game }
  end
end
