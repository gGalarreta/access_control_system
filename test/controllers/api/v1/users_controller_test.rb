require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase

  test "GET #index" do
    get :index
    assert_response :success
  end

  test "POST #create" do
    user = users(:user)
    post :create, params: { user: user }
    assert_response :success
  end

  test "GET #show" do
    user = users(:user)
    get :show, params: { id: user.id }
    assert_response :success
    get :show, params: { id: "" }
    assert_response 400
  end

  test "PUT #update" do
    user = users(:user)
    put :update, params: { id: user.id }
    assert_response :success
    get :show, params: { id: "" }
    assert_response 400  
  end

end
