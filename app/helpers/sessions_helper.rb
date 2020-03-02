module SessionsHelper
  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end
  # Returns the currently logged-in user (if there is any logged-in user)
  def current_user
    if session[:user_id]
      current_user ||= User.find_by(id: session[:user_id])
    end
  end
  #Have a function to determine of the user is logged in
  def logged_in?
    !current_user.nil?
  end
  # Logu out current user
  def log_out
    session.delete(:user_id)
  end

#Returns the current logged-in user and
#Returns true is the given user is the current user
  def current_user?(user)
    user == current_user
  end

  # To avoid Not logged-in users from making microposts
  def only_loggedin_users
    redirect_to login_url unless logged_in? # logged_in? is found in our SessionsHelper
  end
end
