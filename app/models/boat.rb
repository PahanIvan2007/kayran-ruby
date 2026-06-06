class Boat < ApplicationRecord
  belongs_to :point

  has_many :rentals, dependent: :restrict_with_error

  enum :status, { available: 0, rented: 1, repair: 2, inactive: 3, lost: 4 }
  enum :condition_level, { excellent: 0, good: 1, fair: 2, poor: 3 }

  validates :serial_number, :boat_type, presence: true
  validates :serial_number, uniqueness: { scope: :point_id }
end
