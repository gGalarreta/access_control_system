class Web::UsersController < ApplicationController

  layout "admin"

  before_action :set_user, only: [:show, :edit]

  def index
    begin
      options = {
        'end_point': 'users?workday=false',
        'token': cookies[:session_token]
      }
      response = ApiService.new().get(options)
      @users = []
      if response[:status] == 200
        @users = UserSerializer.new().users(response[:data])
      end
    rescue Exception => e
      render 'errors/400'
    end
  end

  def new
  end

  def create
    begin
      options = {
        'end_point': 'users',
        'token': cookies[:session_token]
      }
      body = UserSerializer.new().create_user(user_params)
      response = ApiService.new().post(body, options)
      if response[:status] == 200
        redirect_to web_users_path
      else
        render :new
      end
    rescue Exception => e
      render 'errors/400'
    end
  end

  def show
  end

  def edit
  end

  def update
    begin
      options = {
        'end_point': 'users/' + params["id"],
        'token': cookies[:session_token]
      }
      body = UserSerializer.new().create_user(user_params)
      response = ApiService.new().put(body, options)
      if response[:status] == 200
        redirect_to web_users_path
      else
        render :new
      end   
    rescue Exception => e
      render 'errors/400'
    end
  end

  def destroy
    begin
      options = {
        'end_point': 'users/' + params["id"],
        'token': cookies[:session_token]
      }
      response = ApiService.new().delete(options)
      redirect_to web_users_path
    rescue Exception => e
      render 'errors/400'
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :gender )
    end

    def set_user
      options = {
        'end_point': 'users/' + params["id"],
        'token': cookies[:session_token]
      }
      response = ApiService.new().get(options)
      @users = nil
      if response[:status] == 200
        @user = UserSerializer.new().user(response[:data])
      end
    end

end
