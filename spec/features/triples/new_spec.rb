require 'rails_helper'

RSpec.describe 'triples creation' do

before :each do
    @triplecrown = Triple.create!(country: 'United States', year_established: 1950, dirt_track: true)
    @triplecrown2 = Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false)
    @sirbarton = @triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false)
    @secretariat = @triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false)
    @westaustralian = @triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false)
    @rocksand = @triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false)
end

    describe 'as a user' do
        describe 'when I visit the triples index page' do
            describe 'I see a link to create a new triples record New Triples' do
                it 'when I click the link I am taken to /triples/new where I see a form to create a new parent record' do
                    visit '/triples'
                    click_link 'New Triple Crown'

                    expect(current_path).to eq('/triples/new')
                    expect(page).to have_selector(:css, 'form')
                end

                it 'when I create a new parents attributes, click Create Triple to submit, then a POST request is sent and a new parent record is created' do
                    visit '/triples/new'

                    fill_in('country', with: 'New Zealand')
                    fill_in('year_established', with: 2019)
                    fill_in('dirt_track', with: false)                    
                    click_button('Create Triple Crown Series')
                    
                    expect(current_path).to eq('/triples')
                    expect(page).to have_content('New Zealand')
                end
            end
        end
    end
end