class Performance < ApplicationRecord
  belongs_to :band
  belongs_to :show
  accepts_nested_attributes_for :band 
end
