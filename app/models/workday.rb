class Workday < ApplicationRecord

  enum status: [:in, :out]

  belongs_to :user

end
