class Game
  attr_reader :board, :player1, :player2, :current_player
  attr_writer :current_player

  def initialize(args)
    @board = args[:board]
    @player1 = args[:player1]
    @player2 = args[:player2]
    @current_player = nil
  end

  def place_token(token, index)
    raise 'Cell Occupied' if @board.occupied?(index)
    @board.state[index] = token
  end

  def switch_player
    current_player == player1 ? current_player = player2 : current_player = player1
  end

  def game_over?
    board.game_over?
  end

end
