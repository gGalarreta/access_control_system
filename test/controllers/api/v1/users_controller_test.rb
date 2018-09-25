require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase

  test "GET #index" do
    get :index
    assert_response :success
  end

  test "POST #create" do
    headers = { "Content-Type"=>"application/json", "HTTP_AUTHORIZATION " => "Vz_1dSc9rKju9R88IuTVy6KEvo1SokNgk1zmZAywMQQ"}
    request.headers.merge!(headers)
    user = users(:user)
    post :create, params: {user: user}
    assert_response :success
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
