class Match < ApplicationRecord
  belongs_to :event
  belongs_to :tournament, optional: true
  belongs_to :team_a, class_name: "Team", optional: true
  belongs_to :team_b, class_name: "Team", optional: true
  belongs_to :judge, class_name: "User", optional: true

  enum :status, { scheduled: 0, active: 1, completed: 2, cancelled: 3, postponed: 4 }

  validates :start_time, presence: true
end
