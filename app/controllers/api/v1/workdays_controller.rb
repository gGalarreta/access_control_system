class Api::V1::WorkdaysController < Api::ApiV1Controller

  before_action :set_user, only: [:checkin, :checkout]

  def checkin
    begin
      if register_params[:time]
        @user.save_workday(register_params.merge(status: "in"))
        if @user.save
          render json: {message: "the workday has been setted successfully"}
        else
          response_error(title: 'Could not register', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
        end
      else
        response_error(title: 'Could not register', reasons: {params: "are invalid"}, description: "Time is required", status_code: 422)
      end
    rescue Exception => e
      response_error(title: "Bad Request", reasons: {params: "are invalid"}, description: "You must set the valid params", status_code: 422)
    end
  end

  def checkout
    begin
      if register_params[:time]
        @user.save_workday(register_params.merge(status: "out"))
        if @user.save
          render json: {message: "the workday has been setted successfully"}
        else
          response_error(title: 'Could not register', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
        end      
      else
        response_error(title: 'Could not register', reasons: {params: "are invalid"}, description: "Time is required", status_code: 422)
      end
    rescue Exception => e
      response_error(title: "Bad Request", reasons: {params: "are invalid"}, description: "You must set the valid params", status_code: 422)
    end
  end

  private

    def set_user
      begin
        @user = User.find params[:user_id]
      rescue Exception => e
        response_error(title: "Bad Request", reasons: {params: "are invalid"}, description: "You must include a valid user id", status_code: 400)
      end
    end

    def register_params
      params.require(:register).permit(:time)
    end
end
