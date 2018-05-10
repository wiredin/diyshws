class Performance < ApplicationRecord
  belongs_to :band
  belongs_to :show, optional: true
  accepts_nested_attributes_for :band 
end
