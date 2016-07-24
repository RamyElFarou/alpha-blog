require 'test_helper'
# we want to ensure that we have all the routes and the routes are accessible for the different actions that we will have
#we have an index, we have a new, and we have a show :)

#functional tests

class CategoriesControllerTest < ActionController::TestCase

  def setup  #this is necessary for show because it needs the id of a category to exist
    @category = Category.create(name: "sports") #this hits test database
    @user = User.create(username: "John", email: "john1234@exmaple.com", password: "password", admin: true)
  end

  test "Should get categories index" do
    get :index
    assert_response :success
  end

  test "Should get new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test "Should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

  test "should redirect create when admin not logged in" do #we havent set up a user
    assert_no_difference 'Category.count' do
    post :create, category: {name: "sports"}
    end
    assert_redirected_to categories_path
  end

  test "should redirect create when admin logged in" do

  end

end