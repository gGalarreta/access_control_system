class Web::ReportsController < ApplicationController

  layout "admin"

  before_action :set_user, only: [:employee]
  before_action :set_time, only: [:me, :employee]

  def index
    begin
      options = {
        'end_point': 'users?workday=false',
        'token': cookies[:session_token]
      }
      response = ApiService.new().get(options)
      @users = []
      if response[:status] == 200
        @users = UserSerializer.new().users(response[:data])
      else
        flash.now[:success] = 'A ocurrido un error'
      end    
    rescue Exception => e
      render 'errors/400'
    end
  end

  def me
    begin
      options = {
        'end_point': '/reports/weekly?time=' + @time,
        'token': cookies[:session_token]
      }
      response = ApiService.new().get(options)
      @workdays = []
      @amount_time = ""
      if response[:status] == 200
        @workdays, @amount_time = WorkdaySerializer.new().workdays(response[:data])
      else
        flash.now[:success] = 'A ocurrido un error'
      end
      render :me_report
    rescue Exception => e
      render 'errors/400'
    end    
  end

  def employee
    begin
      options = {
        'end_point': 'users/' + params["id"] + '/reports/weekly?time=' + @time,
        'token': cookies[:session_token]
      }
      response = ApiService.new().get(options)
      @workdays = []
      @amount_time = ""
      if response[:status] == 200
        @workdays, @amount_time = WorkdaySerializer.new().workdays(response[:data])
      else
        flash.now[:success] = 'A ocurrido un error'
      end
      render :employee_report
    rescue Exception => e
      render 'errors/400'
    end
  end

  private

    def set_user
      options = {
        'end_point': 'users/' + params["id"],
        'token': cookies[:session_token]
      }
      response = ApiService.new().get(options)
      @users = nil
      if response[:status] == 200
        @user = UserSerializer.new().user(response[:data])
      end     
    end

    def set_time
      @time = Time.now.to_s
    end
end
