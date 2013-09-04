class User < ActiveRecord::Base
  validates :first_name, uniqueness: { scope: :last_name }
  # validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :posts
  has_many :coments

  geocoded_by :fb_location_name

  has_secure_password

end
