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

  get '/game' do
    erb :game
  end

  post '/game' do
    @player = Player.new(params[:name])
    game.add!(@player)
    game.add!(Player.new('Computer'))
    erb :game
  end

  get '/start_game' do
    @player_choice = game.choose(game.players[0], params[:choice])
    @computer_choice = game.choose(game.players[1], ["rock", "paper", "scissors"].sample)
    @outcome = game.result
    erb :start_game
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
