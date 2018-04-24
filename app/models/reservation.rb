class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :shift
  belongs_to :guest
  belongs_to :table

  validates :restaurant_id, :table_id, :guest_id, :table_id, :time_slot, :guest_count, presence: true
  validates_uniqueness_of :guest_id, scope: [:restaurant_id, :shift_id, :time_slot, :table_id]

  validate :is_valid_time_slot?
  validate :guests_count

  private
  def is_valid_time_slot?
    # Check if slot is valid
    start_time = shift.start_time.strftime("%H:%M %p")
    end_time = shift.end_time.strftime("%H:%M %p")
    unless time_slot > start_time && time_slot < end_time
      errors.add(:time_slot, "Reservation should be between #{start_time} - #{end_time}")
    end
  end

  def guests_count
    unless guest_count <= table.maximum_capacity && guest_count >= table.minimum_capacity
      errors.add(:guest_count, "Should be between #{table.minimum_capacity} - #{table.maximum_capacity}")
    end
  end
end
