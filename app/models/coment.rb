class Coment < ActiveRecord::Base
   belong_to :post
   belong_to :user
end
