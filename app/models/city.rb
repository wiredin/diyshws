class City < ApplicationRecord
  has_many :shows

  validates :name, presence: true
  validates :state, presence: true
  validates :site_name, presence: true, uniqueness: true
end
