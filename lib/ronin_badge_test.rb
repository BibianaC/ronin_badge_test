require 'sinatra/base'
require './lib/player'
require './lib/game'

class RoninBadgeTest < Sinatra::Base

  set :views, Proc.new{ File.join(root, "..", "views") }
  set :public, Proc.new{ File.join(root, "..", "public") }

  game = Game.new

  enable :sessions

  get '/' do
    erb :index
  end

  get '/one_player_game' do
    erb :one_player_game
  end

  post '/one_player_game' do
    @player = Player.new(params[:name])
    game.add!(@player)
    game.add!(Player.new('Computer'))
    erb :one_player_game
  end

  get '/two_players_game' do
    erb :two_players_game
  end

  post '/two_players_game' do
    puts session.inspect
    puts params.inspect
    @player = Player.new(params[:name])
    game.add!(@player)
    session[:player] = @player.object_id
    puts game.inspect
    erb :two_players_game
  end

  get '/end_one_game' do
    @player_choice = game.choose(game.players[0].object_id, params[:choice])
    @computer_choice = game.choose(game.players[1].object_id, ["rock", "paper", "scissors"].sample)
    @outcome = game.result
    erb :end_one_game
  end

  get '/end_two_game' do
    @player_choice = game.choose(session[:player], params[:choice])
    if game.player1_choice == nil || game.player2_choice == nil
      redirect "/wait"
    end
    @name1 = game.players[0].name
    @name2 = game.players[1].name
    @choice1 = game.player1_choice
    @choice2 = game.player2_choice
    @outcome = game.result
    session.clear
    erb :end_two_game
  end

  get '/wait' do
    erb :wait
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
