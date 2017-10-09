require 'game'

describe 'Features of UI: ' do

  it 'Game raises an error if player takes a field that is already taken' do
    game = Game.new
    game.play('X')
    expect { game.play('O') }.to raise_exception('Cell Occupied')
  end

end


