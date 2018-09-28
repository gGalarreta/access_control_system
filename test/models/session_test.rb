require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test 'valid session' do
    user = users(:user)
    session = Session.new(user_id: user.id, access_token: "Vz_1dSc9rKju9R88IuTVy6KEvo1SokNgk1zmZAywMQQ")
    assert session.valid?
  end

  test 'invalid session without user' do
    session = Session.new(user_id: "", access_token: "Vz_1dSc9rKju9R88IuTVy6KEvo1SokNgk1zmZAywMQQ")
    assert_not session.valid?
  end

end
