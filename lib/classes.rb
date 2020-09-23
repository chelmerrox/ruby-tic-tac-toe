# rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
class Player
  attr_reader :name

  def initialize(name, character)
    @name = name
    @character = character
  end
end

class Gameboard
  def print_board(plays)
    puts " #{plays[0]} | #{plays[1]} | #{plays[2]}"
    puts " #{plays[3]} | #{plays[4]} | #{plays[5]}"
    puts " #{plays[6]} | #{plays[7]} | #{plays[8]}"
  end
end

class Gameplay
  def catch_play(plays)
    play = play.to_i
    while plays[play - 1] == 'X' || plays[play - 1] == 'O' || !(play.to_i.positive? && play.to_i <= 9)
      play = gets.chomp.to_i
      if plays[play - 1] == 'X' || plays[play - 1] == 'O' || !(play.to_i.positive? && play.to_i <= 9)
        puts 'Ops, it seems you did not type a number between 1-9 OR someone already choosen this slot before :/'
      end
    end
    play
  end
end

class Game
  def initialize; end

  def check_winner(plays, boards_for_win = [])
    if boards_for_win == []
      boards_for_win = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]
    end

    win = false
    boards_for_win.each do |board|
      first_char = plays[board[0] - 1]
      win = [plays[board[0] - 1], plays[board[1] - 1], plays[board[2] - 1]] == [first_char, first_char, first_char]
      break if win
    end
    win
  end

  def check_draw(plays, boards_for_win = [])
    if boards_for_win == []
      boards_for_win = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]
    end

    draw = true

    boards_for_win.each do |board|
      winner_board = [plays[board[0] - 1], plays[board[1] - 1], plays[board[2] - 1]]
      draw = false if winner_board & ['X'] == [] || winner_board & ['O'] == []
    end

    draw
  end
end

# rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
