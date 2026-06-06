class GpsTrack < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user

  has_many :gps_track_points, dependent: :destroy, foreign_key: :track_id

  enum :status, { active: 0, completed: 1, interrupted: 2 }

  validates :started_at, presence: true
end
