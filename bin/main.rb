# rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

# !/usr/bin/env ruby

puts 'Welcome to our Tic-Tac-Toe Game!'

puts 'Player 1, please type your beautiful name?'
player_one_name = gets.chomp
puts "Nice name #{player_one_name}!"
puts 'Please, notice that, from now on, you are going to be represented by the "X" characters on the board, right?'
gets.chomp

puts 'Player 2, how could we call this beautiful face?'
player_two_name = gets.chomp
puts "Huuummmm #{player_two_name}, I was pretty aware that your name would be also beautiful!"
puts "As #{player_one_name} is already using the 'X' character, you are going to be the 'O' character, nice?"
gets.chomp

puts "#{player_one_name} and #{player_two_name}, please promise me you won't forget your characters?"
gets.chomp

puts "Ok #{player_one_name} and #{player_two_name}, lets to the nuts and bolts!"
puts 'Here is the board of your game, with the respective number for each position, ok?'
plays = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def print_board(plays)
  puts " #{plays[0]} | #{plays[1]} | #{plays[2]}"
  puts " #{plays[3]} | #{plays[4]} | #{plays[5]}"
  puts " #{plays[6]} | #{plays[7]} | #{plays[8]}"
end

puts print_board(plays)
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

call_for_play_phrases = []
call_for_play_phrases << 'So now, PLAYER, could you please choose one of the slots in the board?'
call_for_play_phrases << 'PLAYER, now it\'s your turn!'
call_for_play_phrases << 'PLAYER, no more. Choose your slot please.'
call_for_play_phrases << 'PLAYER, choose your slot and don\'t let your oponent to conquer the world!'
call_for_play_phrases << 'PLAYER, breath and think twice your next slot, it can be not so easy as you think!'
call_for_play_phrases << 'PLAYER, what are you waiting for choose your slot??'
call_for_play_phrases << 'PLAYER, please choose your slot, we don\'t have all the time of the world!!'
call_for_play_phrases << 'PLAYER, we are waiting for you...'
call_for_play_phrases << 'PLAYER, please don\'t make us wait more'

comment_play_phrases = []
comment_play_phrases << 'Huummm... wise fox play!'
comment_play_phrases << 'WoW! I\'m noticing this will be a giant\'s game!'
comment_play_phrases << 'Huummm!'
comment_play_phrases << 'ok'
comment_play_phrases << 'Hey, how many years did you study this game?'
comment_play_phrases << 'Couldn\'t you think something better than this??'
comment_play_phrases << 'Well I don\'t like this play, but anyway...'
comment_play_phrases << 'You never played this before, right?'
comment_play_phrases << '... so amateur'
comment_play_phrases << 'Wow!!! Now I see your potential!'

def check_winner(plays, player_one_name, player_two_name)
  winner_boards = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], [3, 5, 7], [3, 6, 9], [4, 5, 6], [7, 8, 9]]
  win = true
  winner_boards.each do |board|
    win = true
    first_char = plays[board[0] - 1]
    puts "first_char = #{first_char}"
    evaluated_player = first_char == 'X' ? player_one_name : player_two_name 
    puts "board #{board} = [#{board[0] - 1}, #{board[1] - 1}, #{board[0] - 1}"
    board.each do |slot|
      win = false unless plays[slot - 1] == first_char
    end
  end
  return win
end

9.times do |i|
  char = 'X'
  if i.even?
    player = player_one_name.dup
  else
    player = player_two_name.dup
    char = 'O'
  end
  puts call_for_play_phrases[rand(call_for_play_phrases.size - 1)].gsub('PLAYER', player)
  play = catch_play(plays)
  plays[play - 1] = char
  puts print_board(plays)
  puts "check_winner = #{check_winner(plays, player_one_name, player_two_name)}"
  if check_winner(plays, player_one_name, player_two_name) == true  
    puts "Congratulations, #{player}! You are the winner!"
    break
  end 
end

# rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
