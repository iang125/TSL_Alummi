class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
  validates :name, presence: true

  has_secure_password

end
