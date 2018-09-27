class ApplicationController < ActionController::Base

  before_action :global_variables

  def global_variables
    @signed_in = true
    @is_admin = is_user_admin?
  end

  def is_user_admin?
    options = {
      'end_point': 'users/me',
      'token': cookies[:session_token]
    }
    response = ApiService.new().get(options)
    is_admin = false
    if response[:status] == 200
      user = UserSerializer.new().user(response[:data])
      is_admin = user.role == "admin"
    end
  end
end
