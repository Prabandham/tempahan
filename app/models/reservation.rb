class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :shift
  belongs_to :guest

  validates_uniqueness_of :guest_id, scope: [:restaurant_id, :shift_id]
end
