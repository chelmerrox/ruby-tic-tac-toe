# rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

# !/usr/bin/env ruby

require_relative '../lib/classes.rb'

puts 'Welcome to our Tic-Tac-Toe Game!'

puts 'Player 1, please type your beautiful name?'
player_one = Player.new(gets.chomp, 'X')
puts "Nice name #{player_one.name}!"
puts 'Please, notice that, from now on, you are going to be represented by the "X" characters on the board, right?'
gets.chomp

puts 'Player 2, how could we call this beautiful face?'
player_two = Player.new(gets.chomp, 'O')
puts "Huuummmm #{player_two.name}, I was pretty aware that your name would be also beautiful!"
puts "As #{player_one.name} is already using the 'X' character, you are going to be the 'O' character, nice?"
gets.chomp

puts "#{player_one.name} and #{player_two.name}, please promise me you won't forget your characters?"
gets.chomp

puts "Ok #{player_one.name} and #{player_two.name}, lets to the nuts and bolts!"
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

9.times do |i|
  char = 'X'
  if i.even?
    player = player_one.name.dup
  else
    player = player_two.name.dup
    char = 'O'
  end
  puts call_for_play_phrases[rand(call_for_play_phrases.size - 1)].gsub('PLAYER', player)
  play = catch_play(plays)
  plays[play - 1] = char
  puts print_board(plays)
  game_instance = Game.new
  puts "check_winner = #{game_instance.check_winner(plays)}"
  if game_instance.check_winner(plays) == true
    puts "Congratulations, #{player}! You are the winner!"
    break
  elsif game_instance.check_draw(plays) == true
    puts "It's a draw!"
    break
  end
end

# rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
