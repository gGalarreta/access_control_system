class UserSerializer

  def initialize(args = {})
  end

  def users data
    users = data["users"].map { |user|
      user_object(user)
    }
    users
  end

  def create_user params
    body = {
      user: {
        "first_name": params["first_name"],
        "last_name": params["last_name"],
        "email": params["email"],
        "phone": params["phone"],
        "password": params["password"],
        "gender": params["gender"]
      }
    }
    body    
  end

  def user params
    user_object(params["user"])
  end

  private

  def user_object params
    user = OpenStruct.new(id: params["id"], first_name: params["first_name"], last_name: params["last_name"], email: params["email"], phone: params["phone"], gender: params["gender"])
  end
end