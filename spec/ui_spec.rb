require 'game'
require 'board'

describe 'Features of UI: ' do
  let(:human) { double(:human, token: 'X') }
  let(:computer) { double(:computer) }

  it 'Game raises an error if player takes a field that is already taken' do
    board = Board.new
    game = Game.new(board)
    game.play('X')
    expect { game.play('O') }.to raise_exception('Cell Occupied')
  end
end
