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
    winning_row?
  end

  def winning_row?
    value = rows.any? do |row|
      row.count('X') == 3
    end
    value
  end

  def rows
    state.each_slice(3).to_a
  end
end
