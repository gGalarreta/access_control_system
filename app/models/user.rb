class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, numericality: true, length: { minimum:  7, maximum:  9 }, allow_nil: true

  enum gender: [:male, :female, :other]
  enum role: [:employee, :admin]

  has_many :sessions, dependent: :destroy
  has_many :workdays, dependent: :destroy

  DEFAULT_PASSWORD = "acspass2018"
  BEGINNING_OF_WORK_WEEK = 1
  END_OF_WORK_WEEK = 5

  def self.initialize user_params, need_password
    user = User.new user_params
    user.set_password_is_needed need_password
    user
  end

  def set_password_is_needed need_password
    self.password = DEFAULT_PASSWORD if need_password
  end

  def get_workdays current_date
    current_date = current_date.to_date
    workdays = self.workdays.in_daterange(current_date.at_beginning_of_week, current_date.at_end_of_week)
  end

  def get_workdays_in_time current_date
    current_date = current_date.to_date
    workdays = self.workdays.in_daterange(current_date.beginning_of_day, current_date.end_of_day)    
  end

  def weekly_report current_date
    workdays = self.get_workdays current_date
    amount_time = 0
    weekly_report_data = []
    BEGINNING_OF_WORK_WEEK.upto(END_OF_WORK_WEEK) do |day_of_week|
      workday = {
        'day_of_week': day_of_week,
        'data':  workdays.select{ |workday|
              workday.time.strftime("%u").to_i == day_of_week
            }.as_json
      }
      if workday['data'] and (workday['data'].size == 2)
        checkin = Time.parse(workday['data'].first[:time])
        checkout = Time.parse(workday['data'].second[:time])
        amount_time+=(checkout-checkin)/60
      end
      weekly_report_data.append(workday.as_json)
    end
    return weekly_report_data, amount_time
  end

  def save_workday params
    workdays_in_time = self.get_workdays_in_time params[:time]
    register_workday = []
    if workdays_in_time
      register_workday = workdays_in_time.select{ |workday|
        workday.status == params[:status]
      }
    end
    unless register_workday.empty?
      register_workday.first.update_attributes(time: params[:time])
    else
      self.workdays.build(params)
    end
    self
  end

end
