
get '/reviews/:id/reviews' do
    if !logged_in?
        redirect '/'
    end
    id = params['id']
    game = get_game(id)
  
    erb :'/reviews/review', locals: {
      game: game
    }
end