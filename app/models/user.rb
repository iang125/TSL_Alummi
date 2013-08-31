class User < ActiveRecord::Base
  validates :first_name, uniqueness: { scope: :last_name }
  # validates :email, uniqueness: true
  # validates :email, presence: true

  has_many :posts
  has_many :coments

  has_secure_password

end
