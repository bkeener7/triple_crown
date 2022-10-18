require 'rails_helper'

RSpec.describe 'triples index' do

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
        describe 'when I visit /triples' do
        # When I visit '/parents'
        # Then I see the name of each parent record in the system
            it 'sees the name of each country record in the system' do
                visit '/triples'
                expect(page).to have_content(@triplecrown.country)
                expect(page).to have_content(@triplecrown2.country)
            end
        end

        describe 'when I visit the triples index' do
        # I see that records are ordered by most recently created first
        # And next to each of the records I see when it was created
            it 'sees that records are ordered by most recently created first' do
                triplecrown3 = Triple.create!(country: 'Canada', year_established: 1959, dirt_track: false)
                triplecrown4 = Triple.create!(country: 'Australia', year_established: 1935, dirt_track: false)
                visit '/triples'

                expect(triplecrown4.country).to appear_before(triplecrown3.country)
                expect(triplecrown3.country).to appear_before(@triplecrown2.country)
                expect(@triplecrown2.country).to appear_before(@triplecrown.country)
                expect(@triplecrown.country).to_not appear_before(@triplecrown2.country)
            end

            it 'sees when it was created next to each of the records' do
                visit '/triples'

                expect(page).to have_content(@triplecrown.created_at)
                expect(page).to have_content(@triplecrown2.created_at)
            end
        end

        describe 'When I visit any page on the site' do
            # When I visit any page on the site
            # Then I see a link at the top of the page that takes me to the Parent Index
            it 'sees a link at the top of the page that takes me to the triples index' do
                visit '/triples'
                click_on 'Triple Crowns (All Nations)'
                expect(current_path).to eq('/triples')
                
                visit '/winners_table_name'
                click_on 'Triple Crowns (All Nations)'
                expect(current_path).to eq('/triples')

                visit "/triples/#{@triplecrown.id}"
                click_on 'Triple Crowns (All Nations)'
                expect(current_path).to eq('/triples')

                visit "/winners_table_name/#{@secretariat.id}"
                click_on 'Triple Crowns (All Nations)'
                expect(current_path).to eq('/triples')
                
                visit "/triples/#{@triplecrown.id}/winners_table_name"
                click_on 'Triple Crowns (All Nations)'
                expect(current_path).to eq('/triples')
            end
        end

        describe 'When I visit the parent index page' do
            it 'has a link to edit that parents info' do
                visit '/triples'
                click_link "Edit #{@triplecrown.country} Triple Crown"

                expect(current_path).to eq("/triples/#{@triplecrown.id}/edit")

                visit '/triples'
                click_link "Edit #{@triplecrown2.country} Triple Crown"
                expect(current_path).to eq("/triples/#{@triplecrown2.id}/edit")
            end
        end
    
    end
end