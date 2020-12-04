require 'test_helper'

class CategoryIndexTest < ActionDispatch::IntegrationTest

	setup do
    @category = Category.create(name: "Health")
    @category2 = Category.create(name: "Food")
	end

  test "category listing" do
    get '/categories'
    assert_select 'a[href=?]', category_path(@category), text: @category.name
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name
  end

end
