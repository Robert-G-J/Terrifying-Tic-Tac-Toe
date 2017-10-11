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
  ui.request_game_mode
end

run_game
