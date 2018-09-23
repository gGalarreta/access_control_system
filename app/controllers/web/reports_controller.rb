class Web::ReportsController < ApplicationController

  layout "admin"

  before_action :set_user, only: [:employee]

  def index
    options = {
      'end_point': 'users?workday=false',
      'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
    }
    response = ApiService.new().get(options)
    @users = []
    if response[:status] == 200
      @users = UserSerializer.new().users(response[:data])
    end    
  end

  def me
    begin
      time = '22/09/2018 10:30:48'
      options = {
        'end_point': '/reports/weekly?time=' + time,
        'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
      }
      response = ApiService.new().get(options)
      @workdays = []
      if response[:status] == 200
        @workdays = WorkdaySerializer.new().workdays(response[:data])
      end
      render :me_report
    rescue Exception => e
      p e
    end    
  end

  def employee
    begin
      time = '22/09/2018 10:30:48'
      options = {
        'end_point': 'users/' + params["id"] + '/reports/weekly?time=' + time,
        'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
      }
      response = ApiService.new().get(options)
      @workdays = []
      if response[:status] == 200
        @workdays = WorkdaySerializer.new().workdays(response[:data])
      end
      render :employee_report
    rescue Exception => e
      p e
    end
  end

  private

    def set_user
      options = {
        'end_point': 'users/' + params["id"],
        'token': 'MkD58JRFXn3mrrgVzRbdXhuhyaJTVMlGv_dNO4HBZ1w'
      }
      response = ApiService.new().get(options)
      @users = nil
      if response[:status] == 200
        @user = UserSerializer.new().user(response[:data])
      end     
    end
end
