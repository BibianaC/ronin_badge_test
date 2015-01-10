class Game

  attr_reader :players, :player

  def initialize
    @players = []
  end

  def add!(player)
    @players << player
    raise "Only two players are allowed" if @players.length > 2
  end

end