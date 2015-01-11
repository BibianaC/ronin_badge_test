class Game

  attr_reader :players, :player, :player1_choice, :player2_choice

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
      false
    end
  end

  def choose(player_id, choice)
    raise "#{choice} is not a valid choice" if !is_valid?(choice)
    if @players[0].object_id == player_id
      @player1_choice = choice 
    elsif @players[1].object_id == player_id
      @player2_choice = choice
    else
      raise "This player is not part of the game"
    end
  end

  def result
    if @player1_choice == nil || @player2_choice == nil
      "Player choices are not set up"
    elsif @player1_choice == @player2_choice
      "It's a draw"
    elsif (@player1_choice == "rock" && @player2_choice == "scissors") || (@player1_choice == "paper" && @player2_choice == "rock") || (@player1_choice == "scissors" && @player2_choice == "paper")
      "#{@players[0].name} wins"
    else
      "#{@players[1].name} wins"
    end
  end

end