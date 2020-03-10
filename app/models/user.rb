class User < ActiveRecord::Base

  has_many :medications
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true

end