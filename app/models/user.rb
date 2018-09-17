class User < ApplicationRecord
  include Tokenable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum gender: [:male, :female, :other]


  def self.initialize user_params, need_password
    user = User.new user_params
    user.password = Tokenable.random_password if need_password
    user
  end

end
