require 'game_constructor'

describe GameConstructor do
  let(:ui) { double(:ui) }
  let(:game) { double(:game) }
  subject(:gc) { described_class.new(game: game, ui: ui) }

  describe 'starting a new game' do
    it { is_expected.to respond_to :new_game }
  end
end
