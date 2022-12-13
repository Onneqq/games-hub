     
require 'sinatra'
require 'pg'
require 'BCrypt'


def run_sql(sql)
  db = PG.connect(dbname: 'game_hub_db') 
  results = db.exec_params(sql)
  db.close
  results
end

get '/' do
  games = run_sql('SELECT * FROM games')
  erb :index, locals: {
    games: games
  }
end

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

get '/sign_in' do
  erb :sign_in
end





