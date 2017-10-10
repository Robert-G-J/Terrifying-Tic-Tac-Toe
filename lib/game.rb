class Game
  attr_reader :board, :player1, :player2, :cell
  attr_writer :cell

  def initialize(args)
    @board = args[:board]
    @player1 = args[:player1]
    @player2 = args[:player2]
  end

  def place_token(token, index)
    raise 'Cell Occupied' if @board.occupied?(index)
    @board.state[index] = token
  end
end
