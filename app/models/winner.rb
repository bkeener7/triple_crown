class Winner < ApplicationRecord
    belongs_to :triple

    def self.sired_winner
        where(sired_TC_winner: true)
    end

    def self.year_filter(year)
        where("year_won > #{year}")
    end
end