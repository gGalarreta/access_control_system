require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'valid basic user' do
    user = User.new(email: 'john@example.com', password: "pass2018" )
    assert user.valid?
  end

  test 'initialize user without need password' do
    params =  {
        "first_name": "gustavo",
        "email": "gustavo.galarreta.ch@gmail.com",
        "phone": "993702585",
        "password": "password1857",
        "gender": "male"
    }
    user = User.initialize(params, nil)
    assert user.valid?
  end

  test 'initialize user with need password' do
    params =  {
        "first_name": "gustavo",
        "email": "gustavo.galarreta.ch@gmail.com",
        "phone": "993702585",
        "password": "password1857",
        "gender": "male"
    }
    user = User.initialize(params, true)
    assert user.valid?
  end

  test 'valid user' do
    user = User.new(email: 'john@example.com', password: "pass2018", gender: "male", role: "employee", phone: "993702585" )
    assert user.valid?
  end

  test 'valid get_workdays' do
    time = Time.now.to_s
    user = users(:user)
    assert user.get_workdays(time)
  end

  test 'valid get_workdays_in_time' do
    time = Time.now.to_s
    user = users(:user)
    assert user.get_workdays_in_time(time)
  end

  test 'valid weekly_report' do
    time = Time.now.to_s
    user = users(:user)
    assert user.weekly_report(time)
  end

  test 'invalid without email' do
    user = User.new(first_name: 'John')
    assert_not user.valid?
  end

  test 'valid user without password' do
    user = User.new(first_name: 'John', email: 'john@example.com')
    assert_not user.valid?
  end

  test 'invalid with too short password' do
    user = User.new(email: 'john@example.com', password: "123" )
    assert_not user.valid?
  end

  test 'invalid with too short phone' do
    user = User.new(email: 'john@example.com', password: "123", phone: "123" )
    assert_not user.valid?
  end

  test 'invalid with invalid phone format' do
    user = User.new(email: 'john@example.com', password: "123", phone: "adasdasa" )
    assert_not user.valid?
  end

  test 'invalid get_workdays' do
    time = "hello"
    user = users(:user)
    assert_raises Exception do
      user.get_workdays(time)
    end
  end

  test 'invalid get_workdays_in_time' do
    time = "hello"
    user = users(:user)
    assert_raises Exception do
      user.get_workdays_in_time(time)
    end
  end

  test 'invalid weekly_report' do
    time = "hello"
    user = users(:user)
    assert_raises Exception do
      user.weekly_report(time)
    end
  end


end
