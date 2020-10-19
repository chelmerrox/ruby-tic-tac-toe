# This class covers the method for create new player
class Player
  attr_reader :name

  def initialize(name, character)
    @name = name
    @character = character
  end

  def additional_method
    puts 1
  end
end
