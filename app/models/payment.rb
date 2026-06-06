class Payment < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user

  enum :payment_status, { pending: 0, completed: 1, failed: 2, refunded: 3 }

  validates :amount, numericality: { greater_than: 0 }
end
