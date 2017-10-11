require 'Matrix'

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
    lines = rows + columns + first_diagonal + second_diagonal
    p lines
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

  def first_diagonal
    [Matrix.rows(rows).each(:diagonal).to_a]
  end
  
  def second_diagonal
    [Matrix.rows(rows.reverse).each(:diagonal).to_a]
  end
end
