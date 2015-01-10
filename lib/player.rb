class Player

  attr_reader :name, :score, :choice

  def initialize(name)
    @name = name
    @score = 0
  end

  def has_name?
    @name
  end

  def choose(choice)
    @choice = 'rock' || @choice = 'paper' || @choice = 'scissors'
  end

end