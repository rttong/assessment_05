helpers do

  # returns the current user if there is a user signed in.
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def is_logged_in?
  	!current_user.nil?
  end

end
