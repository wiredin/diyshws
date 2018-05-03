class Show < ApplicationRecord
  belongs_to :city

  has_many :performances, -> { order(:position) }
  has_many :bands, through: :performances 
  accepts_nested_attributes_for :bands 
  accepts_nested_attributes_for :performances 

  validate  :start_date_validation
  validates :start_datetime, presence: true
  validates :venue, presence: true
  validates :bands, presence: true

  def start_date 
    date = start_datetime.strftime('%m/%d/%Y') if start_datetime
    date unless date == "10/10/1955" #this date is a placeholder which means its blank
  end

  def start_time
    start_datetime.strftime('%H:%M') if start_datetime
  end
 
  def start_time=(t)
    unless t.blank?
      o = start_datetime.nil? ? "10/10/1955" : start_datetime.strftime('%m/%d/%Y')  #if its not nil store original date
      self.start_datetime = DateTime.strptime(o+t,"%m/%d/%Y%H:%M") 
    end
  end

  def start_date=(d)
    unless d.blank?
      o = start_datetime.nil? ? "20:00" : start_datetime.strftime('%H:%M')  #if its not nil store original time 
      self.start_datetime = DateTime.strptime(d+o,"%m/%d/%Y%H:%M") 
    end
  end

  private
   
    def start_date_validation
      if self.start_date.blank? 
        self.errors.add(:start_date, "can't be blank")
      end
    end
    

end
