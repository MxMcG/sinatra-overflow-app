get '/users/signup' do
  @user = User.new
  if request.xhr?
    erb :"/users/signup", layout: false
  else
    erb :"/users/signup"
  end
end

post '/users/signup' do
  @user = User.create(params[:new_user])
  session[:user_id] = @user.id
  p params
  if @user.save
    redirect "/"
  else
    erb :"/users/signup"
  end
end

post '/users/login' do
  @user = User.find_by(username: params[:username])
  if @user == nil || @user.password != params[:password]
    redirect '/users/login'
  else
    auth_login(@user)
    redirect "/"
  end
end

get '/users/login' do
  if request.xhr?
    erb :"/users/login", layout: false
  else
    erb :"/users/login"
  end
end

get '/logout' do
  auth_logout
  redirect "/"
end

