class TeamMember < ApplicationRecord
  belongs_to :team
  belongs_to :user

  enum :role, { player: 0, captain: 1, substitute: 2, coach: 3 }

  validates :user_id, uniqueness: { scope: :team_id }
end
