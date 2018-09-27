require 'test_helper'

class WorkdayTest < ActiveSupport::TestCase

  test 'valid workday in' do
    user = users(:user)
    time = Time.now.to_s
    workday = Workday.new(user_id: user.id, status: "in", time: time)
    assert workday.valid?
  end

  test 'valid workday out' do
    user = users(:user)
    time = Time.now.to_s
    workday = Workday.new(user_id: user.id, status: "out", time: time)
    assert workday.valid?
  end

  test 'invalid workday without user' do
    time = Time.now.to_s
    workday = Workday.new(user_id: "", status: "out", time: time)
    assert_not workday.valid?
  end

  test 'invalid workday without time' do
    user = users(:user)
    workday = Workday.new(user_id: user.id, status: "in", time: "")
    assert_not workday.valid?
  end

  test 'valid workday without status' do
    user = users(:user)
    time = Time.now.to_s
    workday = Workday.new(user_id: user.id, status: "", time: time)
    assert_not workday.valid?
  end

end
