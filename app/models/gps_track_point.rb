class GpsTrackPoint < ApplicationRecord
  belongs_to :track, class_name: "GpsTrack"

  validates :timestamp, :lat, :lng, presence: true
end
