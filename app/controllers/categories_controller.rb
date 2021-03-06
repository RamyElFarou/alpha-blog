class CategoriesController < ApplicationController
    before_action :require_admin, only: [:new, :create, :edit]


  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end


  def create
    @category = Category.new(category_params)
    if @category.save
        flash[:success] = "Category was created successfully"
        redirect_to categories_path #this redirects to categories index
      else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
        flash[:success] = "Category name was successfully uodated"
        redirect_to category_path(@category)
      else
      render 'edit'
    end
  end

  private
  def category_params
  params.require(:category).permit(:name) #permit contains paramaters to be white listed when the method is called
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end



end