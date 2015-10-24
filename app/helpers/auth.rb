helpers do

  def auth_login(user)
    session[:user_id] = user.id
    auth_current_user
  end

  def auth_logout
    session.destroy
  end

  def auth_current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

end



