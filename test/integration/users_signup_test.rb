require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest


  test "User signing up test" do
  	get '/signup'
    assert_response :success
    assert_difference 'User.count', 1 do
    	post users_url, params: {user: {name: "diegoxxx", email: "diegoloco@gmail.com", 
    										password: "123456", admin: false}}
    assert_redirected_to articles_url
    end
  end


end
