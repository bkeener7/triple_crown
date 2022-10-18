require 'rails_helper'

RSpec.describe Triple do
    it {should have_many :winners}

    before :each do
        @triplecrown = Triple.create!(country: 'United States', year_established: 1950, dirt_track: true)
        @triplecrown2 = Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false)
        @sirbarton = @triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false)
        @secretariat = @triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false)
        @westaustralian = @triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false)
        @rocksand = @triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false)
    end

    it 'puts Triple Crowns in order of created_at' do
        triplecrown3 = Triple.create!(country: 'Canada', year_established: 1959, dirt_track: false)
        triplecrown4 = Triple.create!(country: 'Australia', year_established: 1935, dirt_track: false)
        triples = Triple.all

        expect(triples.order_by_created_at).to eq([triplecrown4, triplecrown3, @triplecrown2, @triplecrown])
    end

    it 'can count the number of winners in each Triple Crown' do
        expect(@triplecrown.winner_count).to eq(2)
    end

end