class Show < ApplicationRecord
  belongs_to :city

  has_many :performances
  has_many :bands, through: :performances
  accepts_nested_attributes_for :bands 

  validates :start_datetime, presence: true
  validates :venue, presence: true
  validates :bands, presence: true

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
