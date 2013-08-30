class Post < ActiveRecord::Base
  has_many :coments
  belong_to :user
end
