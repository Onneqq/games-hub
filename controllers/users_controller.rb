
get '/users/new' do
    erb :'users/new'
  end
  
post '/users' do
    username = params['username']
    email = params['email']
  
    create_user(username, email)
    
    redirect '/'
end