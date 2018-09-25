require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase

  test "GET #index" do
    get :index
    assert_response :success
  end

  test "POST #create" do
    user_mock = users(:user)
    user = 
    {
        "first_name": user_mock.first_name,
        "email": user_mock.email,
        "phone": user_mock.phone,
        "password": user_mock.encrypted_password,
        "gender": user_mock.gender
    }
    post :create, params: { user: user }
    assert_response 422
  end

  test "PUT #update" do
    user = users(:user)
    put :update, params: { id: user.id }
    assert_response 422
    get :show, params: { id: "" }
    assert_response 400 
  end

  test "GET #show" do
    user = users(:user)
    get :show, params: { id: user.id }
    assert_response :success
    get :show, params: { id: "" }
    assert_response 400
  end

  test "GET #me" do
    get :me
    assert_response 400
  end

  test "DELETE #destroy" do
    user = users(:user)
    get :destroy, params: { id: user.id }
    assert_response 400
    delete :destroy, params: { id: "" }
    assert_response 400
  end

end
