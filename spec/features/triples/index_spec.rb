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

        describe 'when I visit /winners_table_name' do
        # When I visit '/child_table_name'
        # Then I see each Child in the system including the Child's attributes
            it 'sees each winner in the system including the winners attributes' do
                visit '/winners_table_name'

                expect(page).to have_content(@sirbarton.name)
                expect(page).to have_content(@sirbarton.year_won)
                expect(page).to have_content(@sirbarton.jockey)
                expect(page).to have_content(@sirbarton.trainer)
                expect(page).to have_content(@sirbarton.sired_TC_winner)
                expect(page).to have_content(@secretariat.name)
                expect(page).to have_content(@secretariat.year_won)
                expect(page).to have_content(@secretariat.jockey)
                expect(page).to have_content(@secretariat.trainer)
                expect(page).to have_content(@secretariat.sired_TC_winner)
                expect(page).to have_content(@westaustralian.name)
                expect(page).to have_content(@rocksand.name)
            end
        end
    end
end