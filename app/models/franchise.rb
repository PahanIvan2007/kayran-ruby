class Franchise < ApplicationRecord
  belongs_to :owner, class_name: "User", optional: true

  has_many :points, dependent: :restrict_with_error

  enum :status, { active: 0, suspended: 1, closed: 2 }

  validates :title, presence: true, uniqueness: true
end
