class Game
  attr_reader :board, :cell
  attr_writer :cell

  def initialize(board)
    @board = board
    @cell = ''
  end

  def play(token)
    raise 'Cell Occupied' if @cell != ''
    @cell = token
  end
end
