require "sinatra/base"
require "./lib/player.rb"
require "./lib/attack.rb"
require "./lib/game.rb"

class Battle < Sinatra::Base
  set :session_secret, "This should make sessions work in shotgun"
  enable :sessions

  get "/" do
    erb(:index)
    # "player1 =" << session[:player1].inspect
  end

  post "/names" do
    $game = Game.new
    $player1 = Player.new(params[:player1])
    $player2 = Player.new(params[:player2])
    redirect to('/play')
  end

  get "/play" do
    erb(:play)
  end

  get "/fight" do
    erb(:fight)
  end

  get "/attack" do
    $game.cycle
    erb(:attack)
  end

  run! if app_file == $0
end
