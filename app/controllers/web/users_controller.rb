class Web::UsersController < ApplicationController

  layout "admin"

  before_action :set_user, only: [:show, :edit]

  def index
    options = {
      'end_point': 'users?workday=false',
      'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
    }
    response = ApiService.new().get(options)
    @users = []
    if response[:status] == 200
      @users = UserSerializer.new().users(response[:data])
    end
  end

  def new
    params["user"] = {}
    @user = UserSerializer.new().user(params)
  end

  def create
    options = {
      'end_point': 'users',
      'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
    }
    body = UserSerializer.new().create_user(user_params)
    response = ApiService.new().post(body, options)
    if response[:status] == 200
      redirect_to web_users_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    options = {
      'end_point': 'users/' + params["id"],
      'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
    }
    body = UserSerializer.new().create_user(user_params)
    response = ApiService.new().put(body, options)
    if response[:status] == 200
      redirect_to web_users_path
    else
      render :new
    end   
  end

  def destroy
    options = {
      'end_point': 'users/' + params["id"],
      'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
    }
    response = ApiService.new().delete(options)
    redirect_to web_users_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :gender )
    end

    def set_user
      options = {
        'end_point': 'users/' + params["id"],
        'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
      }
      response = ApiService.new().get(options)
      @users = nil
      if response[:status] == 200
        @user = UserSerializer.new().user(response[:data])
      end
    end

end
