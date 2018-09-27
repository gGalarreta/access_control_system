require 'test_helper'

class Api::V1::ReportsControllerTest < ActionController::TestCase

  test "GET #employees" do
    user = users(:user)
    session = sessions(:session)
    @request.headers['HTTP_AUTHORIZATION'] = session.access_token

    time = Time.now.to_s
    get :employees, params: { user_id: user.id, time: time}
    assert_response :success
    
    #ERRORS
    #withoud id
    get :employees, params: { user_id: ""}
    assert_response 400
    #withoud time
    get :employees, params: { user_id: user.id }
    assert_response 422
  end

  test "GET #admin" do
    session = sessions(:session)
    @request.headers['HTTP_AUTHORIZATION'] = session.access_token

    user = users(:user)
    time = Time.now.to_s
    get :employees, params: { user_id: user.id, time: time}
    assert_response :success

    #ERRORS
    #withoud id
    get :employees, params: { user_id: ""}
    assert_response 400
    #withoud time
    get :employees, params: { user_id: user.id }
    assert_response 422
  end
end
