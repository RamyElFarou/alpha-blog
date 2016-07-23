require 'test_helper'
#Unit tests

class CategoryTest < ActiveSupport::TestCase

    def setup
      @category = Category.new(name: "sports")
    end

    test "category should be valid" do
      assert @category.valid?
    end

    test "name should be present" do # if .valid? returns true, test will fail. Test is expecting a false return
      @category.name = " "
      assert_not @category.valid?
    end

    test "name should be unique" do #this test isnt working, but validated via manual testing
      @category.save
      category2 = Category.new(name: "sports")
      assert_not category2.valid?
    end

    test "name should not be too long" do
      @category.name = "a" * 26
      assert_not @category.valid?
    end

    test "name should not be too short" do
      @category.name = "a" * 2
      assert_not @category.valid?
    end
end

#this tests that we can setup a category instance variable and it will be valid, so assertion is true
