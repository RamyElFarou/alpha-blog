class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show

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

  private
  def category_params
  params.require(:category).permit(:name) #permit contains paramaters to be white listed when the method is called
  end

end