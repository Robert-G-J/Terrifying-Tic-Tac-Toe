require 'ui'

describe UI do
  subject(:ui) { described_class.new }

  it 'Welcomes the players' do
    welcome_msg = "Welcome to Tic-Tac-Toe\n"
    expect { ui.welcome }.to output(welcome_msg).to_stdout
  end

  it 'Requests the player pick a position' do
    message = "Pick a square from 1-9\n"
    expect { ui.pick_square }.to output(message).to_stdout
  end
end
