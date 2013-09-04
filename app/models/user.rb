class User < ActiveRecord::Base
  validates :first_name, uniqueness: { scope: :last_name }
  # validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :posts
  has_many :coments

  geocoded_by :fb_location_name

  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  #     "#{self.street}, #{self.city}, #{self.country}"
  end

  has_secure_password

end
