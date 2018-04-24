class Guest < ApplicationRecord
  has_many :reservations
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  # source http://www.regular-expressions.info/email.html
  validates :email, format: { with: /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i }
end
