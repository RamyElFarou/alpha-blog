class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #methods created here are available throughout all controllers, but not available to views (by default)
  #restricting actions based on if user is logged in or not
  helper_method :current_user, :logged_in? #now these 2 methods are available in our views (see above).. this is helper_method

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id] # if statement to check session hash. this returns user object, ||= means if not
  end

  def logged_in?
    !!current_user       #  returns true if it has a current user... !! converts to boolean
  end

  def require_user
    if !logged_in?
      flash[:danger]= "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
