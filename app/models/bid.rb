class Bid < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true

  validates_numericality_of :value
end
