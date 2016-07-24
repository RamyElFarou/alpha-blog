require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
#we have successfully implemented ability to create a category from the UI
  def setup
    @category = Category.create(name: "books")
    @category2 = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get categories_path #categories listing
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name #there should be a link to sports category
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
end