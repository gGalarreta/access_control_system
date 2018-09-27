require 'test_helper'

class Api::V1::SessionsControllerTest < ActionController::TestCase

  test "POST #create" do
    #DATA
    user_mock = users(:user)
    existed_user = 
    {
      "email": user_mock.email,
      "password": user_mock.encrypted_password,
    }
    new_user = 
    {
      "email": "gustavo.galarreta@pucp.pe",
      "password": "password1857",
    }

    post :create, params: { user: new_user, format: 'json' }
    assert_response :success
    
    #ERRORS
    #existed user
    post :create, params: { user: existed_user }
    assert_response 422

  end

  test "DELETE #destroy" do
    session = sessions(:session)
    @request.headers['HTTP_AUTHORIZATION'] = session.access_token
    delete :destroy
    assert_response :success
  end
end
