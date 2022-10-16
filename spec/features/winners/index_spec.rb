require 'rails_helper'

RSpec.describe 'winners index' do

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

        describe 'When I visit any page on the site' do
        # When I visit any page on the site
        # Then I see a link at the top of the page that takes me to the Child Index
            it 'sees a link at the top of the page that takes me to the winners index' do
                visit '/triples'
                click_on 'All Triple Crown Winners'
                expect(current_path).to eq('/winners_table_name')

                visit '/winners_table_name'
                click_on 'All Triple Crown Winners'
                expect(current_path).to eq('/winners_table_name')

                visit "/triples/#{@triplecrown.id}"
                click_on 'All Triple Crown Winners'
                expect(current_path).to eq('/winners_table_name')

                visit "/winners_table_name/#{@secretariat.id}"
                click_on 'All Triple Crown Winners'
                expect(current_path).to eq('/winners_table_name')

                visit "/triples/#{@triplecrown.id}/winners_table_name"
                click_on 'All Triple Crown Winners'
                expect(current_path).to eq('/winners_table_name')
            end
        end
    end
end