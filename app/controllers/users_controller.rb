class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show] #user is ready for edit, update, and show action, remove redunden..
    before_action :require_same_user, only: [:edit, :update]
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) #white-list what is being passed through (paramaters)#
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
        # before_save set_user When we're editing, we must have a user present
  end

  def update

    if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to articles_path
      else
        render 'edit'
    end
  end

  def show

    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5) #we need this to paginate the users articles
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id]) #before action method
  end

  def require_same_user
     if current_user != @user
       flash[:danger] = "You can only edit your own account"
       redirect_to root_path
     end
  end

end