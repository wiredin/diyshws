class Show < ApplicationRecord
  validates :start_datetime, presence: true
  validates :venue, presence: true

  def start_date 
    self.start_datetime.strftime("%A, %b %d")
  end

  def start_time
    if self.start_datetime.strftime("%M") == "00"
      self.start_datetime.strftime("%l%P")
    else
      self.start_datetime.strftime("%l:%M%P")
    end      
  end

end
