require 'game'
require 'board'

describe 'Features of UI: ' do

  it 'Game raises an error if player takes a field that is already taken' do
    human_player = Human.new
    computer_player = Computer.new
    board = Board.new
    game = Game.new(
      player1: human_player,
      player2: computer_player,
      board: board
    )
    game.place_token('X', 0)
    expect { game.place_token('O', 0) }.to raise_exception('Cell Occupied')
  end
end
