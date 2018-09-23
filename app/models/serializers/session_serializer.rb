class SessionSerializer

  def initialize(args = {})
  end

  def create_request params
    body = {
      user: {
        'email': params["email"],
        'password': params["password"]
      }
    }
    body
  end
end