class Show < ApplicationRecord
  validates :start_date, presence: true
  validates :venue, presence: true
end
