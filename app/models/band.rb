class Band < ApplicationRecord

  validates :name, presence: true
  validates :country, presence: true
end
