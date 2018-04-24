class Table < ApplicationRecord
  belongs_to :restaurant

  validate :max_and_min_capacity

  private
  def max_and_min_capacity
    errors.add(:minimum_capacity, 'Cannot be blank') and return if minimum_capacity.blank?
    errors.add(:maximum_capacity, 'Cannot be blank') and return if maximum_capacity.blank?
    unless minimum_capacity <= maximum_capacity
      errors.add(:minimum_capacity, 'Should be less than or equal to Maximum Capacity')
    end
  end
end
