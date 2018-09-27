class Workday < ApplicationRecord

  enum status: [:in, :out]

  belongs_to :user

  scope :in_daterange, ->(start_date, end_date) { joins(:user).where(time: start_date..end_date) }

end
