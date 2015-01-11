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
      false
    end
  end

  def choose(player, choice)
    raise "#{choice} is not a valid choice" if !is_valid?(choice)
    if @players[0] == player
      @player1_choice = choice 
    elsif @players[1] == player
      @player2_choice = choice
    else
      raise "The player #{player.name} is not part of the game"
    end
  end

  # def result
  #   if @player1_choice == nil || @player2_choice == nil
  #     return "Player choices are not set up"
  #   elsif @player1_choice == @player2_choice
  #     return "It's a draw"
  #   elsif @player1_choice == "rock" && @player2_choice == "paper"
  #     return "#{players[0].name} lose"
  #   elsif @player1_choice == "rock" && @player2_choice == "scissors"
  #     return "You win"
  #   elsif @player1_choice == "paper" && @player2_choice == "rock"
  #     return "You win"
  #   elsif @player1_choice == "paper" && @player2_choice == "scissors"
  #     return "You lose"
  #   elsif @player1_choice == "scissors" && @player2_choice == "rock"
  #     return "You lose"
  #   elsif @player1_choice == "scissors" && @player2_choice == "paper"
  #     return "You win"
  #   else
  #     return "error"
  #   end
  # end

end