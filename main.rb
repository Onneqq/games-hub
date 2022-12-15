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
require './models/review'

# controllers
require './controllers/games_controller'
require './controllers/users_controller'
require './controllers/sessions_controller'
require './controllers/reviews_controller'

# helpers
require './helpers/sessions_helper'

get '/profile' do
  games = run_sql('SELECT * FROM games')
  erb :profile, locals: {
    games: games
  }
end

