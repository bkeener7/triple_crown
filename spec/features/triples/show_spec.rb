require 'rails_helper'

RSpec.describe 'triples show' do

before :each do
    @triplecrown = Triple.create!(country: 'United States', year_established: 1950, dirt_track: true)
    @triplecrown2 = Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false)
    @sirbarton = @triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false)
    @secretariat = @triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false)
    @westaustralian = @triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false)
    @rocksand = @triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false)
end

    describe 'as a user' do
    # As a visitor
        describe 'when I visit /triples/:id' do
        # When I visit '/parents/:id'
        # Then I see the parent with that id including the parent's attributes
            it 'sees the triple crown with that id including the triple crown attributes' do
                visit "/triples/#{@triplecrown.id}"

                expect(page).to have_content(@triplecrown.country)
                expect(page).to have_content(@triplecrown.year_established)
                expect(page).to have_content(@triplecrown.dirt_track)

                expect(page).to_not have_content(@triplecrown2.country)
                expect(page).to_not have_content(@triplecrown2.year_established)
                expect(page).to_not have_content(@triplecrown2.dirt_track)
            end
        end
    end
end