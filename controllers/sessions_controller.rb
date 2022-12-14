get '/sessions/new' do
    erb :'sessions/new'
end

post '/sessions' do
    email = params['email']
    password = params['password']

    user = find_user_by_email(email)
    puts user
    puts password
    # check password is correct with BCrypt
    if user && BCrypt::Password.new(user['password_digest']) == password

        session['user_id'] = user['id']
        redirect '/'
    else
        erb :'sessions/new'
    end
end

delete '/sessions' do
    session['user_id'] = nil
    redirect '/'
end

