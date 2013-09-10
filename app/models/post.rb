class Post < ActiveRecord::Base
  has_many :coments
  belongs_to :user
end
