require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions
  get '/' do
    session[:attack_confirmation] = nil
    erb(:index)
  end

  post '/names' do
    Game.start(Game.new(Player.new(params[:player1]),Player.new(params[:player2])))
    redirect "/play"
  end

  get "/play" do
    @pl1, @pl2 = Game.read.player1.name, Game.read.player2.name
    @hp1, @hp2 = Game.read.player1.hp, Game.read.player2.hp
    @attack_confirmation = session[:attack_confirmation]
    erb(:play)
  end

  get '/attack' do
    @player2 = Game.read.player2
    Game.read.attack
    session[:attack_confirmation] = Game.read.attacked_player
    redirect "/play"
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
