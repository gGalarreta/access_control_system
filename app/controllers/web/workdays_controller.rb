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
    @user_id = params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def checkout
  end

  def register_checkin
  end

  def register_checkout
  end
  
end
