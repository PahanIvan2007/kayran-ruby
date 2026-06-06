class Point < ApplicationRecord
  self.inheritance_column = nil
  belongs_to :franchise, optional: true

  has_many :events, dependent: :restrict_with_error
  has_many :boats, dependent: :restrict_with_error

  enum :point_type, { base: 0, franchise: 1, temporary_event: 2, storage: 3 }
  enum :status, { active: 0, inactive: 1, closed: 2 }

  validates :title, :lat, :lng, presence: true
end
