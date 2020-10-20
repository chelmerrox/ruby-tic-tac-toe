# This class covers the methods check_draw and check_winner
class Game
  def initialize; end

  def winning_board(boards_for_win = [])
    boards_for_win << [1, 2, 3]
    boards_for_win << [1, 4, 7]
    boards_for_win << [1, 5, 9]
    boards_for_win << [2, 5, 8]
    boards_for_win << [3, 5, 7]
    boards_for_win << [3, 6, 9]
    boards_for_win << [4, 5, 6]
    boards_for_win << [7, 8, 9]
  end

  def check_winner?(plays, boards_for_win = [])
    winning_board(boards_for_win) if boards_for_win == []

    win = false
    boards_for_win.each do |board|
      first_char = plays[board[0] - 1]
      win = [plays[board[0] - 1], plays[board[1] - 1], plays[board[2] - 1]] == [first_char, first_char, first_char]
      break if win
    end
    win
  end

  def check_draw?(plays, boards_for_win = [])
    winning_board(boards_for_win) if boards_for_win == []

    draw = true

    boards_for_win.each do |board|
      winner_board = [plays[board[0] - 1], plays[board[1] - 1], plays[board[2] - 1]]
      draw = false if winner_board & ['X'] == [] || winner_board & ['O'] == []
    end

    draw
  end
end
