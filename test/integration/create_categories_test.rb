require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
#we have successfully implemented ability to create a category from the UI
  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new' #this was already confirmed in category controller test, just another approach
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new' #this was already confirmed in category controller test, just another approach
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: " "}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title' #this is referencing the body of the error partial.. these need to show up
    assert_select 'div.panel-body'
  end

end