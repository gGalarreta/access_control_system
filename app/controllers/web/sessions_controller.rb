class Web::SessionsController < ApplicationController


  def new
    
  end

  def create
    body = SessionSerializer.new().create_request(session_params)
    response = ApiService.new().post(body, {"end_point": "sessions"})
    if response[:status] == 200
      redirect_to web_users_path
    else
      render :new
    end
  end


  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
