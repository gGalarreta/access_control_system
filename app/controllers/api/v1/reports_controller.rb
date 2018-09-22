class Api::V1::ReportsController < Api::ApiV1Controller

  before_action :set_user, only: [:employees]

  def employees
    begin
      @workdays = @user.weekly_report params[:time]
      render :weekly
    rescue Exception => e
      render json: {message: e}
    end
  end

  def admin
    begin
      @workdays = current_user.weekly_report params[:time]
      render :weekly
    rescue Exception => e
      render json: {message: e}
    end
  end

  private
    def set_user
      @user = User.find params[:user_id]
    end
end
