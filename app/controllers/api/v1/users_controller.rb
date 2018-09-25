class Api::V1::UsersController < Api::ApiV1Controller

  before_action :set_user, only: [:update, :show, :destroy]
  before_action :set_workday, only: [:index, :create, :update, :show, :me]
  
  def index
    begin
      @users = User.all 
      render :users
    rescue Exception => e
      render json: {message: e}
    end
  end

  def create
    begin
      @user = User.initialize user_params, params[:user][:need_password]
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
      render :user
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

  def destroy
    begin
      @user.destroy
      render json: {message: "The user was deleted successfully"}
    rescue Exception => e
      render json: {message: e}
    end
  end

  private

    def set_workday
      @workday = params[:workday]
      if params[:workday] != nil
        @workday = params[:workday] == "true" ? true : false
      end
    end

    def extra_params
      params.permit(:workday)
    end

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :gender)
    end
end
