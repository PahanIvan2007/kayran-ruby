class RoutePoint < ApplicationRecord
  belongs_to :route

  enum :checkpoint_type, { start: 0, waypoint: 1, finish: 2, rest: 3, danger: 4 }

  validates :order_index, :lat, :lng, presence: true
  validates :order_index, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
