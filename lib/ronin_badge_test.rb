require 'sinatra/base'

class RoninBadgeTest < Sinatra::Base

  set :views, Proc.new{ File.join(root, "..", "views") }
  set :public, Proc.new{ File.join(root, "..", "public") }

  get '/' do
    erb :index
  end

  get '/game' do
    @name = params[:name]
    erb :game
  end

  post '/game' do
    @name = params[:name]
    erb :game
  end

  get '/start_game' do
    @player_choice = params[:choice]
    @computer_choice = ["rock", "paper", "scissors"].sample

    if @player_choice == @computer_choice
      @outcome = "It's a draw"
    elsif @player_choice == "rock" && @computer_choice == "paper"
      @outcome = "You lose"
    elsif @player_choice == "rock" && @computer_choice == "scissors"
      @outcome = "You win"
    elsif @player_choice == "paper" && @computer_choice == "rock"
      @outcome = "You win"
    elsif @player_choice == "paper" && @computer_choice == "scissors"
      @outcome = "You lose"
    elsif @player_choice == "scissors" && @computer_choice == "rock"
      @outcome = "You lose"
    elsif @player_choice == "scissors" && @computer_choice == "paper"
      @outcome = "You win"
    else
      @outcome = "error"
    end
    erb :start_game
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
