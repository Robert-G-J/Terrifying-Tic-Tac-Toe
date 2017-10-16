class UI
  def welcome
    puts 'Welcome to Tic-Tac-Toe'
  end

  def pick_square
    puts "Pick a square from 1-9"
  end

  def request_game_mode
    puts "Pick a game mode:\n 
    1. 🙂  vs. 🙂\n
    2. 🙂  vs. 🤖\n 
    3. 🤖  vs. 🤖\n"
  end

  def print_board(board)
    board.state.each_with_index do |field, index|
      if field.nil?
        print index
        print ' ' if index <= 9
      else
        print field + ' '
      end
 
      if (index + 1 == board.state.length)
        print "\n"
      elsif ((index + 1) % board.board_size).zero?
        print "\n" + horizontal_dividers(board.board_size) + "\n"
      else 
        print '| '
      end
    end
  end

  private

  def horizontal_dividers(row_length)
    '=' * (4 * row_length - 3)
  end
end
