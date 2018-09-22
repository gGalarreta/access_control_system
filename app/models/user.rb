class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: [:male, :female, :other]

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
    beginning_of_week = current_date.at_beginning_of_week
    end_of_week = current_date.at_end_of_week
    workdays = self.workdays.in_daterange(beginning_of_week, end_of_week)
  end

  def weekly_report current_date
    workdays = self.get_workdays current_date
    weekly_report_data = []
    BEGINNING_OF_WORK_WEEK.upto(END_OF_WORK_WEEK) do |day_of_week|
      workday = {
        'day_of_week': day_of_week,
        'data':  workdays.select{ |workday|
              workday.time.strftime("%u").to_i == day_of_week
            }.as_json
      }
      weekly_report_data.append(workday.as_json)
    end
    weekly_report_data
  end

end
