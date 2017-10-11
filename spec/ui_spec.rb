require 'UI'

describe UI do
  subject(:ui) { described_class.new }

  it 'Welcomes the players' do
    welcome_msg = "Welcome to Tic-Tac-Toe\n"
    expect { ui.welcome }.to output(welcome_msg).to_stdout
  end
end
