class HistoryItem < ApplicationRecord
  belongs_to :project
  has_one :user

  scope :ordered, -> { order(created_at: :desc) }
end
