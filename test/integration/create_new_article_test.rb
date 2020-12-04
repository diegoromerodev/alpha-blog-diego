require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(name: "diegoromero6", email: "diegoromero6@gmail.com",
                              password: "password", admin: true)
    @signed_in = sign_in(@admin_user)
  end


  test "Article creation" do
    get '/articles/new'
    assert_response :success
    assert_difference 'Article.count', 1 do
    	post articles_url, params: { article: { title: "Cool new article", 
    															description: "Is christmas really coming?", 
    															category_ids: "1" } }
    assert_response :redirect
  	end
  	follow_redirect!
  	assert_select 'div.alert'
  end

end
