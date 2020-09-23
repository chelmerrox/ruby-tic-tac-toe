# rubocop:disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
class Player
  attr_reader :name

  def initialize(name, character)
    @name = name
    @character = character
  end
end

# rubocop:enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
