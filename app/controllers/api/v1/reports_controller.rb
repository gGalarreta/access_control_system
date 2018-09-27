class Api::V1::ReportsController < Api::ApiV1Controller

  before_action :set_user, only: [:employees]

  def employees
    begin
      if params[:time]
        @workdays, @amount_time = @user.weekly_report params[:time]
        render :weekly
      else
        response_error(title: 'Could not register', reasons: {params: "are invalid"}, description: "Time is required", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def admin
    begin
      if params[:time]
        @workdays, @amount_time = current_user.weekly_report params[:time]
        render :weekly
      else
        response_error(title: 'Could not register', reasons: {params: "are invalid"}, description: "Time is required", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
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
end
