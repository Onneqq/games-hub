
get '/reviews/:id/reviews' do
    if !logged_in?
        redirect '/'
    end
    id = params['id'].to_i
    game = get_game(id)
    reviews = get_reviews(id)
    erb :'/reviews/review', locals: {
      game: game,
      reviews: reviews,
      gameid: id
    }
end

get '/reviews/:id/new' do
    if !logged_in?
        redirect '/'
    end
    id = params['id'].to_i
    game = get_game(id)
    erb :'/reviews/new', locals: {
        game: game,
        gameid: id
      }
  end

  post '/reviews/add/:id' do
    review = params['review']
    id = params['id'].to_i
    
    create_review(session['user_id'], id, review)

    redirect '/reviews/' + id.to_s + '/reviews'
  end