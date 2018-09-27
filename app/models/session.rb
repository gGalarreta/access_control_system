class Session < ApplicationRecord

  include Tokenable

  validates :access_token, presence: true

  belongs_to :user

end
