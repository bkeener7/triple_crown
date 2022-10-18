class Winner < ApplicationRecord
    belongs_to :triple

    def self.sired_winner
        where(sired_TC_winner: true)
    end
end