class Alumni < ActiveRecord::Base
  validates :first_name, uniqueness: { scope: :last_name }
end
