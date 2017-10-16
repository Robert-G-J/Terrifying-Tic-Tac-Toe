class UI
  def welcome
    puts 'Welcome to Tic-Tac-Toe'
  end

  def pick_square
    puts 'Pick a square from 0-8'
  end

  def placing_token
    puts 'Placing token: '
  end

  def print_board(board)
    board.state.each_with_index do |field, index|
      print_characters(field, index) 
      print_dividers(board, index)
    end
  end

  private

  def print_characters(field, index)
    if field.nil?
      print index
      print ' ' if index <= 9
    else
      print field + ' '
    end
  end

  def print_dividers(board, index)
    if end_of_board?(board, index)
      print "\n\n"
    elsif end_of_row?(board, index)
      print "\n" + horizontal_dividers(board.board_size) + "\n"
    else 
      print '| '
    end
  end

  def horizontal_dividers(row_length)
    '=' * (4 * row_length - 3)
  end

  def end_of_board?(board, index)
    (index + 1 == board.state.length)
  end

  def end_of_row?(board, index)
    ((index + 1) % board.board_size).zero?
  end
end
