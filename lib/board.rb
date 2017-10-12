require 'matrix'

class Board
  attr_reader :state, :board_size
  attr_writer :state

  def initialize(board_size = 3)
    @state = Array.new(board_size**2)
    @board_size = board_size
  end
  
  def occupied?(index)
    state[index.to_i] != nil
  end

  def game_over?
    winning_line? || tied?
  end

  def winning_line?
    line_permutations.any? do |line|
      line.count('X') == board_size
    end
  end

  private 

  def tied?
    full_board? && !winning_line?
  end

  def full_board?
    state.none? { |field| field == nil } 
  end

  def line_permutations
    rows + columns + first_diagonal + second_diagonal
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
