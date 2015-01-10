class Game

  attr_reader :players, :player

  def initialize
    @players = []
    
  end

  def add!(player)
    @players << player
    raise "Only two players are allowed" if @players.length > 2
  end

  def is_valid?(choice)
    if choice == 'rock' || choice == 'paper' || choice == 'scissors'
      return true
    else
      raise "Not a valid option"
    end
  end

end