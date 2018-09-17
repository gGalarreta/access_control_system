class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: [:male, :female, :other]

  has_many :sessions, dependent: :destroy

  DEFAULT_PASSWORD = "acspass2018"

  def self.initialize user_params, need_password
    user = User.new user_params
    user.set_password_is_needed need_password
    user
  end

  def set_password_is_needed need_password
    self.password = DEFAULT_PASSWORD if need_password
  end

end
