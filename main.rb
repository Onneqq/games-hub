require 'dotenv/load'
require 'sinatra'
require 'pg'
require 'bcrypt'
require './db/db'
require 'httparty'

enable :sessions

# models
require './models/game'
require './models/user'

# controllers
require './controllers/games_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'

# helpers
require './helpers/sessions_helper'

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