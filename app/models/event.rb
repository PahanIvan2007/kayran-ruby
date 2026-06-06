class Event < ApplicationRecord
  belongs_to :point, optional: true
  belongs_to :route, optional: true
  belongs_to :user, optional: true

  has_many :rentals, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :tournaments, dependent: :destroy
  has_many :gps_tracks, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :logs, dependent: :destroy

  enum :event_type, { rental: 0, training: 1, route: 2, match: 3, tournament: 4, inclusive_program: 5, festival: 6 }
  enum :status, { planned: 0, active: 1, completed: 2, cancelled: 3, emergency: 4 }
  enum :visibility, { public_event: 0, private_event: 1, franchise_only: 2 }

  validates :title, :start_time, presence: true
  validates :event_type, :status, presence: true

  scope :upcoming, -> { where("start_time > ?", Time.current).order(start_time: :asc) }
  scope :active_events, -> { where(status: :active) }
end
