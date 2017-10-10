require 'game'
require 'board'

describe 'Features of UI: ' do
    let(:human_player) { Human.new }
    let(:computer_player) { Computer.new }
    let(:board) { Board.new }
    let(:game) { Game.new(
      player1: human_player,
      player2: computer_player,
      board: board
    ) }

  it 'Game raises an error if player takes a field that is already taken' do
    game.place_token('X', 0)
    expect { game.place_token('O', 0) }.to raise_exception('Cell Occupied')
  end

  xit 'Game is over if all fields are taken' do
  end

end
