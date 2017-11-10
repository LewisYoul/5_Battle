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
    $game = Game.new(Player.new(params[:player1]),Player.new(params[:player2]))
    redirect "/play"
  end

  get "/play" do
    @pl1, @pl2 = $game.player1.name, $game.player2.name
    @hp1, @hp2 = $game.player1.hp, $game.player2.hp
    @attack_confirmation = session[:attack_confirmation]
    erb(:play)
  end

  get '/attack' do
    @player2 = $game.player2
    $game.attack
    session[:attack_confirmation] = $game.attacked_player
    redirect "/play"
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
