class Player
  attr_reader :name

  def initialize(name, character)
    @name = name
    @character = character
  end

  def additional_method
    result = 1+1
  end
end
