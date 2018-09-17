class Api::V1::SessionsController < Api::ApiV1Controller
  
  skip_before_action :verify_current_user, only: [:create]

  def create
    email = session_params[:email].downcase
    password = session_params[:password]
    unless email.blank? and password.blank?
      user = User.find_by(email: email)
      if user    
        if user.valid_password?(password)
          @session = user.sessions.create
          render :show
        else
          response_error(title: "The session could not be initiated", reasons: {password: "is invalid"}, description: "Try again with valid values", status_code: 422)
        end
      else
        response_error(title: "The session could not be initiated", reasons: {email: "is invalid"}, description: "Try again with valid values", status_code: 422)
      end
    end
  end

  def destroy
    begin
      current_session.destroy
      render json: {message: "The session was deleted successfully"}
    rescue Exception => e
      render json: {message: e}
    end
  end

  private

    def session_params
      params.require(:user).permit(:email, :password)
    end
end
