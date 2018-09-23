class Web::UsersController < ApplicationController
  
  layout "admin"

  def index
    options = {
      'end_point': 'users?workday=false',
      'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
    }
    response = ApiService.new().get(options)
    @users = UserSerializer.new().all_users(response[:data])
  end

  def new
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

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :gender )
    end

end
