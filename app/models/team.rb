class Team < ApplicationRecord
  belongs_to :captain, class_name: "User", optional: true

  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members
  has_many :home_matches, class_name: "Match", foreign_key: :team_a_id, dependent: :restrict_with_error
  has_many :away_matches, class_name: "Match", foreign_key: :team_b_id, dependent: :restrict_with_error

  enum :status, { active: 0, inactive: 1, disbanded: 2 }

  validates :title, presence: true, uniqueness: true
end
