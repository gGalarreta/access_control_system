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
        redirect_to web_users_path
      else
        render js: iziToast.success({ title: 'Al parecer ocurrio un error', message: 'Funciona shit'});
      end
    rescue Exception => e
      #render "errors/errors_messages", locals: {message: e}
    end
  end

  def logout
    options = {
      'end_point': 'sessions',
      'token': cookies[:session_token]
    }
    response = ApiService.new().delete(options)
    if response[:status] == 200
      redirect_to :root
    end
  end

  private
    def session_params
      params.require(:user).permit(:email, :password)
    end
end
