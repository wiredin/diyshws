class Band < ApplicationRecord
  has_many :performances
  has_many :shows, through: :performances
  validates :name, presence: true
  validates :country, presence: true

end



