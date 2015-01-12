class Player

  attr_reader :name, :score, :choice

  def initialize(name)
    @name = name
  end

  def has_name?
    @name
  end

  def choose(choice)
    @choice = choice
  end

end