     
require 'sinatra'
require 'pg'
require 'BCrypt'


def run_sql(sql, sql_params = [])
  db = PG.connect(dbname: 'game_hub_db') 
  results = db.exec_params(sql, sql_params)
  db.close
  results
end

get '/' do
  games = run_sql('SELECT * FROM games ORDER BY id')
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

get '/new' do
  erb :'/games/new'
end

get '/games/new' do
  erb :'games/new'
end

post '/games' do
  name = params['name']
  image_url = params['image_url']
  game_description = params['game_description']
  genre = params['genre']
  review_score = params['review_score']
  run_sql("INSERT INTO games(name, image_url, game_description, genre, review_score) VALUES($1, $2, $3, $4, $5)", [name, image_url, game_description, genre, review_score])

  redirect '/'
end


get '/games/:id/edit' do
  id = params['id']
  game = run_sql('SELECT * FROM games WHERE id = $1', [id])[0]

  erb :'/games/edit', locals: {
    game: game
  }
end

put '/games/:id' do
  id = params['id']
  name = params['name']
  image_url = params['image_url']
  game_description = params['game_description']
  genre = params['genre']
  review_score = params['review_score']
  run_sql('UPDATE games SET name = $2, image_url = $3, game_description = $4, genre = $5, review_score = $6 WHERE id = $1', [id, name, image_url, game_description, genre, review_score])

  redirect '/'
end

delete '/games/:id' do
  id = params['id']

  run_sql('DELETE FROM games WHERE id = $1', [id])

  redirect '/'
end
