class Workday < ApplicationRecord

  #validates :status, presence: true
  #validates :time, presence: true

  enum status: [:in, :out]

  belongs_to :user

  scope :in_daterange, ->(start_date, end_date) { joins(:user).where(time: start_date..end_date) }

end
