class Post < ActiveRecord::Base
  has_many :coments
  belongs_to :user

  def old?
    if (self.created_at + 3.month) < Time.zone.now
      self.destroy
      return true
    else
      return false
    end
  end

end
