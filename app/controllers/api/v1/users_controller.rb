class Api::V1::UsersController < Api::ApiV1Controller

  before_action :set_user, only: [:update, :show, :me]

  def create
    begin
      @user = User.new user_params
      if @user.save
        render :user
      else
        response_error(title: 'Could not register', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def update
    begin
      if @user.update_attributes user_params
        render :user
      else
        response_error(title: 'Could not update', reasons: @user.errors.messages, description: "There are invalid values", status_code: 422)
      end
    rescue Exception => e
      render json: {message: e}
    end
  end

  def show
    begin
      render :show
    rescue Exception => e
      render json: {message: e}
    end
  end

  def me
    begin
      @user = current_user
      render :user
    rescue Exception => e
      render json: {message: e}
    end
  end

  private

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :gender)
    end
end
