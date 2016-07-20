class SessionsController < ApplicationController

  def new

  end

  def create #submit of new is handled by create
    user = User.find_by(email: params[:session][:email].downcase) #emails stored in db are downcase
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id #browsers cookies handle this by saving user_id to session .. (this is how your usernames save)
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)

    else
    flash.now[:danger]= "There was something wrong with your login information" #we only want flash on first page after error
    render 'new'     #no validation msg because not a model back form (no validation messages because no model for session)
                     #so we have to create a friendly message to let them know that something was wrong
    end

  end #end of create action

  def destroy #end the session and move the user to a logged out state
      session[:user_id] = nil
      flash[:success] = "You have logged out"
      redirect_to root_path
  end

end