class Board

  attr_reader :state
  attr_writer :state

  def initialize
    @state = []
  end
  
  def occupied?(index)
    state[index.to_i] != nil
  end

  def game_over?
    winning_line?
  end

  def winning_line?
    lines = rows + columns
    lines.any? do |line|
      line.count('X') == 3
    end
  end

  def rows
    state.each_slice(3).to_a
  end

  def columns
    rows.transpose
  end
end
