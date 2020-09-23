# rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
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
# rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
