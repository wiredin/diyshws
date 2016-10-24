class Show < ApplicationRecord
  belongs_to :city

  has_many :performances
  has_many :bands, through: :performances
  accepts_nested_attributes_for :bands 

  validates :start_datetime, presence: true
  validates :venue, presence: true
  validates :bands, presence: true

  def start_date 
    start_datetime.strftime('%m/%d/%Y') if start_datetime
  end

  def start_time
    start_datetime.strftime('%H:%M') if start_datetime
  end
 
  def start_time=(t)j
    o = start_datetime.nil? ? "10/10/2016" : start_datetime.strftime('%m/%d/%Y')  #if its not nil store original date
    self.start_datetime = DateTime.strptime(o+t,"%m/%d/%Y%H:%M") 
  end

  def start_date=(d)
    o = start_datetime.nil? ? "20:00" : start_datetime.strftime('%H:%M')  #if its not nil store original time 
    self.start_datetime = DateTime.strptime(d+o,"%m/%d/%Y%H:%M") 
  end

end
