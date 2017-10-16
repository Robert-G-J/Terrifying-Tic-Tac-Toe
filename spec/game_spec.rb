require 'game'

describe Game do
  let(:human) { double(:human, token: '🏄') }
  let(:computer) { double(:computer, token: '🤖') }
  let(:board) { spy(:board, occupied?: false) }
  subject(:game) { described_class.new(
    player1: human,
    player2: computer,
    board: board
  ) }

  describe '#initialize' do
    it 'has a board' do
      expect(game.board).to eq board
    end

    it 'has a player 1' do
      expect(game.player1).to eq human
    end

    it 'has a player 2' do
      expect(game.player2).to eq computer
    end
  end

  describe '#current_player' do
    it { is_expected.to respond_to :current_player }
  end

  describe '#switch_player' do
    it 'changes the current_player' do
      game.current_player = human
      expect(game.switch_player).to eq computer
    end
  end

  describe '#game_over?' do
    it '-> Delegates checking to the Board class' do
      game.game_over?
      expect(game.board).to have_received(:game_over?) 
    end
  end

  describe '#place_token:' do
    it { is_expected.to respond_to(:place_token).with(2).arguments }

    context 'if the field is free' do
      it 'a token is put on it' do
        field = 0
        board = game.board
        allow(board).to receive(:state)
        allow(board.state).to receive(:[]=)
        game.place_token('X', field)
        expect(board.state).to have_received(:[]=)
      end
    end
 
    context 'if the field is occupied' do
      it 'it raises an exception' do
        allow(game.board).to receive(:occupied?).with(0) { true }
        expect { game.place_token('O', 0) }.to raise_exception('Cell Occupied')
      end
    end
  end
end
