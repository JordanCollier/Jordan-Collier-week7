class Course < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true

  def time_of_day
     if self.tod == true
       "day"
    else
       "night"
    end
  end

end
