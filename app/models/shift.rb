class Shift < ApplicationRecord
  belongs_to :restaturant
  has_many :reservations

  validate :end_time_should_be_greater_than_start_time

  def end_time_should_be_greater_than_start_time
    if start_time >= end_time
      errors.add(:end_time, "must be greater than start_time")
    end
  end
end
