class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
  have_many :posts
  have_many :coments

  has_secure_password

end
