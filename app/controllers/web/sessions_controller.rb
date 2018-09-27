class Web::SessionsController < ApplicationController

  def new
  end

  def create
    begin
      options = {
        'end_point': 'sessions',
      }
      body = SessionSerializer.new().create_request(session_params)
      response = ApiService.new().post(body, options)
      if response[:status] == 200
        cookies[:session_token] = response[:data]["session"]["access_token"]
        flash.now[:success] = "Bienvenido"
        redirect_to web_users_path
      else
        flash.now[:success] = 'A ocurrido un error'
        render :new
      end
    rescue Exception => e
      render 'errors/400'
    end
  end

  def logout
    begin
      options = {
        'end_point': 'sessions',
        'token': cookies[:session_token]
      }
      response = ApiService.new().delete(options)
      if response[:status] == 200
        redirect_to :root
      else
        flash.now[:success] = 'A ocurrido un error'
      end
    rescue Exception => e
      redirect_to :root
    end
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
