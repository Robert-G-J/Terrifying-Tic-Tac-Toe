require './lib/ui'
require './lib/game'
require './lib/human'
require './lib/computer'
require './lib/board'

def run_game
  ui = UI.new
  board = Board.new
  human = Human.new(token:'🏄')
  computer = Computer.new(token:'🤖') 
  game = Game.new(board: board, player1: human, player2: computer)
  ui.welcome
  until game.game_over? do 
    ui.print_board(game.board)
    ui.pick_square
    field_choice = gets.chomp.to_i
    game.place_token('X', field_choice)
  end
end

run_game
