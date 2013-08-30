class User < ActiveRecord::Base
  # validates :email, uniqueness: true
  # validates :email, presence: true

  has_many :posts
  has_many :coments

  has_secure_password

end
