class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { participant: 0, instructor: 1, judge: 2, volunteer: 3, franchise_admin: 4, system_admin: 5 }
  enum :status, { active: 0, blocked: 1, deleted: 2, pending: 3 }
  enum :accessibility_level, { no_restrictions: 0, low: 1, medium: 2, high: 3 }

  has_many :created_events, class_name: "Event"
  has_many :rentals
  has_many :gps_tracks
  has_many :team_members
  has_many :teams, through: :team_members
  has_many :payments
  has_many :logs

  validates :first_name, :last_name, presence: true, if: :active?
  validates :phone, uniqueness: true, allow_blank: true

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def active?
    status == "active"
  end
end
