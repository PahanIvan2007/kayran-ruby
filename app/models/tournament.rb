class Tournament < ApplicationRecord
  belongs_to :event

  has_many :matches, dependent: :destroy

  enum :format, { knockout: 0, round_robin: 1, group_stage: 2 }
  enum :status, { planned: 0, active: 1, completed: 2, cancelled: 3 }

  validates :title, presence: true
end
