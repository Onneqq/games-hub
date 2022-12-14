     
require 'sinatra'
require 'pg'
require 'bcrypt'
require './db/db'

require './models/game'
require './models/user'

require './controllers/games_controller'
require './controllers/users_controller'


get '/profile' do
  games = run_sql('SELECT * FROM games')
  erb :profile, locals: {
    games: games
  }
end

get '/reviews' do
  games = run_sql('SELECT * FROM games')
  erb :reviews, locals: {
    games: games
  }
end