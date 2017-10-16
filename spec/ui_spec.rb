require 'ui'

describe UI do
  subject(:ui) { described_class.new }

  it 'Welcomes the players' do
    welcome_msg = "Welcome to Tic-Tac-Toe\n"
    expect { ui.welcome }.to output(welcome_msg).to_stdout
  end

  it 'Requests the player pick a position' do
    message = "Pick a square from 0-8\n"
    expect { ui.pick_square }.to output(message).to_stdout
  end

  it 'Indicates a token is being placed' do
    message = "Placing token: \n"
    expect { ui.placing_token }.to output(message).to_stdout
  end

  it 'prints the board' do
    board = double(:board, state: [ nil, 'X', 'O', nil, 'X', nil, nil, nil, nil], board_size: 3)
    printed_board =  "0 | X | O \n=========\n3 | X | 5 \n=========\n6 | 7 | 8 \n\n"
    expect { ui.print_board(board) }.to output(printed_board).to_stdout
  end
end
