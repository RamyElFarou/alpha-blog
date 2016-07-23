require 'test_helper'
# we want to ensure that we have all the routes and the routes are accessible for the different actions that we will have
#we have an index, we have a new, and we have a show :)

#functional tests

class CategoriesControllerTest < ActionController::TestCase

  def setup  #this is necessary for show because it needs the id of a category to exist
    @category = Category.create(name: "sports") #this hits test database
  end

  test "Should get categories index" do
    get :index
    assert_response :success
  end

  test "Should get new" do
    get :new
    assert_response :success
  end

  test "Should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

end