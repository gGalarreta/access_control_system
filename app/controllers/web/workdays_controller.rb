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
    @user_id = params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def register_checkin
    options = {
      'end_point': 'users/' + params[:user_id] + '/workdays/checkin',
      'token': cookies[:session_token]
    }
    body = {
      "register": 
        {"time": params[:time]}
      }
    response = ApiService.new().put(body, options)
    if response[:status] == 200
      redirect_to web_users_path
    end
  end

  def register_checkout
    options = {
      'end_point': 'users/' + params[:user_id] + '/workdays/checkout',
      'token': cookies[:session_token]
    }
    body = {
      "register": 
        {"time": params[:time]}
      }
    response = ApiService.new().put(body, options)
    if response[:status] == 200
      redirect_to web_users_path
    end
  end
  
end
