require 'test_helper'
class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(name: "diegoromero6", email: "diegoromero6@gmail.com",
                              password: "password", admin: true)
    @signed_in = sign_in(@admin_user)
  end

  test "creating category" do
    get '/categories/new'
    assert_response :success
    assert_difference 'Category.count', 1 do
    	post categories_url, params: {category: { name: "Food" } }
    	assert_response :redirect
    end
    follow_redirect!
    assert_match "Food", response.body
  end

   test "rejecting invalid category" do
    get '/categories/new'
    assert_response :success
    assert_no_difference 'Category.count' do
    	post categories_url, params: {category: { name: "Fd" } }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
