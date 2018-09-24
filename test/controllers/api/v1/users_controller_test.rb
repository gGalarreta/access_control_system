require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "create action should be success" do
    user = users(:user)

    post :create, user: user

    assert_reponse :success
  end
 #test "index action should be success" do
    #get :index
    #assert_reponse :success    
 #end

 #test "show action should be success" do
 #   user = users(:user)
 #   get :show, id: user.id
 #   assert_reponse :success
 #end

end
