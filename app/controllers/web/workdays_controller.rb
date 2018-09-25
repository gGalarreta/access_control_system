class Web::WorkdaysController < ApplicationController
  layout "admin"

  def index
    options = {
      'end_point': 'users?workday=false',
      'token': cookies[:session_token]
    }
    response = ApiService.new().get(options)
    @users = []
    if response[:status] == 200
      @users = UserSerializer.new().users(response[:data])
    end
  end

  def checkin
    
  end

  def checkout
    
  end
  
end
