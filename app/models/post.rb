class Post < ActiveRecord::Base
  have_many :coments
  belong_to :user
end
