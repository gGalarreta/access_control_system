class Api::V1::WorkdaysController < Api::ApiV1Controller

  before_action :set_user, only: [:checkin, :checkout]

  def checkin
    begin
      @user.workdays.build(register_params.merge(status: :in))
      if @user.save
        render json: {message: "the workday has been setted successfully"}
      else
        response_error(title: 'Could not register', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def checkout
    begin
      @user.workdays.build(register_params.merge(status: :out))
      if @user.save
        render json: {message: "the workday has been setted successfully"}
      else
        response_error(title: 'Could not register', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
      end      
    rescue Exception => e
      render json: {message: e}
    end
  end

  private

    def set_user
      @user = User.find params[:user_id]
    end

    def register_params
      params.require(:register).permit(:time)
    end
end
