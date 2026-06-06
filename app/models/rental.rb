class Rental < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :boat

  has_one :payment, dependent: :nullify

  enum :status, { active: 0, completed: 1, cancelled: 2, overdue: 3 }

  validates :start_time, presence: true

  scope :current, -> { where(status: :active) }
end
