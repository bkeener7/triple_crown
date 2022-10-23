class Triple < ApplicationRecord
  has_many :winners, dependent: :destroy

  def self.order_by_created_at
    order(created_at: :desc)
  end

  def winner_count
    winners.length
  end
end
