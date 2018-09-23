class UserSerializer

  attr_reader :data_tag

  def initialize(args = {})
  end

  def all_users data
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

  private

  def user_object params
    user = OpenStruct.new(id: params["id"], first_name: params["first_name"], last_name: params["last_name"], email: params["email"],
      phone: params["phone"], gender: params["gender"])
  end
end