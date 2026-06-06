class Log < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user, optional: true

  validates :action_type, presence: true
end
