class City < ApplicationRecord
  validates :name, presence: true
  validates :state, presence: true
  validates :site_name, presence: true, uniqueness: true
end
