class Game

  attr_reader :cell
  attr_writer :cell

  def initialize
    @cell = ''
  end

  def play(token)
    raise 'Cell Occupied' if @cell != ''
    @cell = token
  end

end
