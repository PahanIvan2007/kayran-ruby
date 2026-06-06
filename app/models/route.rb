class Route < ApplicationRecord
  has_many :route_points, dependent: :destroy
  has_many :events, dependent: :restrict_with_error

  enum :difficulty, { easy: 0, medium: 1, hard: 2, adaptive: 3 }
  enum :route_type, { water: 0, hiking: 1, mixed: 2 }
  enum :status, { active: 0, inactive: 1, closed: 2 }

  validates :title, presence: true
  validates :distance_km, numericality: { greater_than: 0 }, allow_nil: true

  accepts_nested_attributes_for :route_points, allow_destroy: true
end
