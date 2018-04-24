class Restaurant < ApplicationRecord
  validates :name, :email, :phone, presence: true
  validates :email, :phone, uniqueness: true
  validates :email, format: { with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i } # May be good to move this to a concern
  validates :phone, format: { with: /\A\+603\s\d{4}\s\d{4}\z/ } # Took +603 2713 0485 as reference.

  has_many :shifts
  has_many :tables
  has_many :reservations
end
