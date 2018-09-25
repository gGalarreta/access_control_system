require 'test_helper'

class Api::V1::WorkdaysControllerTest < ActionController::TestCase

  test "PUT #checkin" do
    user = users(:user)
    time = Time.now.to_s
    put :checkin, params: { user_id: user.id, register: {"time": time } }
    assert_response :success
  end

  test "PUT #checkout" do
    user = users(:user)
    time = Time.now.to_s
    put :checkout, params: { user_id: user.id, register: {"time": time }}
    assert_response :success
  end

end
