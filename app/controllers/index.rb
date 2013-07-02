get '/' do
  if current_user
    @user = User.all
  end
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

# sign_in
post '/sessions' do
  @user = User.authenticate(params[:email], params[:password])

  if @user
    session[:user_id] = @user.id
    redirect '/'
  else
  	@errors = @user.errors.messages
    erb :sign_in
  end
end

# sign out - Is this being invoked via AJAX?
delete '/sessions/:id' do
  session.clear 
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

# sign_up
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.messages
    erb :sign_up
  end
end
