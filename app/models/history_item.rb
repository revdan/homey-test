class HistoryItem < ApplicationRecord
  include Presentable

  belongs_to :project
  belongs_to :user

  validates :body, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
