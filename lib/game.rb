class Game

  attr_reader :players, :player

  def initialize
    @players = []
  end

  def add!(player)
    @players << player
  end

end