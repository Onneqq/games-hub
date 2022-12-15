get '/' do
    games = all_games()

    erb :index, locals: {
      games: games
    }
end

# get '/new' do
#     erb :'/games/new'
# end

get '/games/new' do
    if !logged_in?
        redirect '/'
    end
    erb :'games/new'
end

post '/games' do
    if !logged_in?
        redirect '/'
    end
    name = params['name']
    image_url = params['image_url']
    game_description = params['game_description']
    genre = params['genre']
    review_score = params['review_score']

    create_game(name, image_url, game_description, genre, review_score)

    redirect '/'
end

get '/games/:id/edit' do
    if !logged_in?
        redirect '/'
    end
    id = params['id']
    game = get_game(id)
  
    erb :'/games/edit', locals: {
      game: game
    }
end

put '/games/:id' do
    if !logged_in?
        redirect '/'
    end
    id = params['id']
    name = params['name']
    image_url = params['image_url']
    game_description = params['game_description']
    genre = params['genre']
    review_score = params['review_score']

    update_game(id, name, image_url, game_description, genre, review_score)
  
    redirect '/'
end

delete '/games/:id' do
    if !logged_in?
        redirect '/'
    end
    id = params['id']

    delete_game(id)

    redirect '/'
end

post '/games/:id/likes' do
    game_id = params['id']
    user_id = params['user_id']

    run_sql('INSERT INTO likes(user_id, game_id)')
end