class Triple < ApplicationRecord
  has_many :winners, dependent: :destroy

  scope :order_by_created_at, -> { order(created_at: :desc) }

  def winner_count
    winners.count
  end
end
