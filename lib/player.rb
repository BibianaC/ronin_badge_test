class Player

  attr_reader :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end

  def has_name?
    @name
  end

end