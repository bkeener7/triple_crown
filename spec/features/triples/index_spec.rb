require 'rails_helper'

RSpec.describe 'Triples index' do

before :each do
    @triplecrown = Triple.create!(country: 'United States', year_established: 1950, dirt_track: true)
    @triplecrown2 = Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false)
    @sirbarton = @triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false)
    @secretariat = @triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false)
    @westaustralian = @triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false)
    @rocksand = @triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false)
end

    describe 'as a user' do
    # When I visit '/parents'
    # Then I see the name of each parent record in the system
        describe 'when I visit /triples' do
            it 'sees the name of each country record in the system' do
                visit '/triples'
                expect(page).to have_content(@triplecrown.country)
                expect(page).to have_content(@triplecrown2.country)
            end
        end
    end
end