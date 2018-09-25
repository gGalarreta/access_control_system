require 'test_helper'

class Api::V1::SessionsControllerTest < ActionController::TestCase

  test "POST #create" do
    user_mock = users(:user)
    user = 
    {
      "email": user_mock.email,
      "password": user_mock.encrypted_password,
    }
    post :create, params: { user: user }
    assert_response 422
=begin
    user = 
    {
      "email": "gustavo.galarreta@pucp.pe",
      "password": "password1857",
    }
    post :create, params: { user: user }
    assert_response :success
=end
  end

  test "DELETE #destroy" do
    session = sessions(:session)
    @request.headers['HTTP_AUTHORIZATION'] = session.access_token
    delete :destroy
    assert_response :success
  end
end
