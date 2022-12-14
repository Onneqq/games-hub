
get '/users/new' do
    erb :'users/new'
  end
  
post '/users' do
    username = params['username']
    email = params['email']
    password = params['password']
  
    create_user(username, email, password)
    
    redirect '/'
end