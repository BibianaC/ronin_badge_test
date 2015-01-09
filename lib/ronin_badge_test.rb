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

  # start the server if ruby file executed directly
  run! if app_file == $0
end
