require 'test_helper'

class Api::V1::WorkdaysControllerTest < ActionController::TestCase

  test "PUT #checkin" do
    #DATA
    user = users(:user)
    time = Time.now.to_s

    put :checkin, params: { user_id: user.id, register: {"time": time } }
    assert_response :success

    #ERRORS
    #withoud id
    put :checkin, params: { user_id: ""}
    assert_response 400
    #withoud time
    put :checkin, params: { user_id: user.id }
    assert_response 422    
  end

  test "PUT #checkout" do
    #DATA
    user = users(:user)
    time = Time.now.to_s

    put :checkout, params: { user_id: user.id, register: {"time": time }}
    assert_response :success

    #ERRORS
    #withoud id
    put :checkout, params: { user_id: ""}
    assert_response 400
    #withoud time
    put :checkout, params: { user_id: user.id }
    assert_response 422
  end

end
