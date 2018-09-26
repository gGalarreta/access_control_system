require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase

  test "GET #index" do
    get :index
    assert_response :success
  end

  test "POST #create" do
    #DATA
    user_mock = users(:user)
    new_user = 
    {
        "first_name": user_mock.first_name,
        "email": "gustavo.galarreta2@pucp.pe",
        "phone": user_mock.phone,
        "password": user_mock.encrypted_password,
        "gender": user_mock.gender
    }
    existed_user = 
    {
        "first_name": user_mock.first_name,
        "email": user_mock.email,
        "phone": user_mock.phone,
        "password": user_mock.encrypted_password,
        "gender": user_mock.gender
    }
    user_with_invalid_email = 
    {
        "first_name": "test",
        "email": "test",
        "phone": "993702585",
        "password": "password1857",
        "gender": "male"
    }
    user_with_invalid_email 

    #valid data
    post :create, params: { user: new_user, format: 'json' }
    assert_response :success

    #ERRORS
    #email taken
    post :create, params: { user: existed_user }
    assert_response 422
    #invalid email format
    post :create, params: { user: user_with_invalid_email }
    assert_response 422    
  end

  test "PUT #update" do

    #DATA

    user_mock = users(:user)
    user = 
    {
        "first_name": "test",
        "email": "test@test.com",
        "phone": "993702585",
        "password": "password1857",
        "gender": "male"
    }
    existed_user = 
    {
        "first_name": user_mock.first_name,
        "email": "test@pucp.pe",
        "phone": user_mock.phone,
        "password": user_mock.encrypted_password,
        "gender": user_mock.gender
    }

    
    #valid data
    put :update, params: { id: user_mock.id, user: user, format: 'json' }
    assert_response :success
    
    #ERRORS
    #without params
    put :update, params: { id: user_mock.id, format: 'json' }
    assert_response 422
    #without id
    put :update, params: { id: "" }
    assert_response 400 
    #email taken
    put :update, params: { id: user_mock.id, user: existed_user }
    assert_response 422
  end

  test "GET #show" do
    user = users(:user)
    get :show, params: { id: user.id, format: 'json'}
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
    delete :destroy, params: { id: user.id }
    assert_response :success
    delete :destroy, params: { id: "" }
    assert_response 400
  end

end
