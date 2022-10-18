require 'rails_helper'

RSpec.describe 'triple/winners index' do

before :each do
    @triplecrown = Triple.create!(country: 'United States', year_established: 1950, dirt_track: true)
    @triplecrown2 = Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false)
    @sirbarton = @triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false)
    @gallantfox = @triplecrown.winners.create!(name: 'Gallant Fox', year_won: 1930, jockey: 'Earl Sande', trainer: 'Jim Fitzsimmons', sired_TC_winner: true)
    @secretariat = @triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false)
    @westaustralian = @triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false)
    @rocksand = @triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false)
end

    describe 'as a user' do
    # As a visitor
        describe 'when I visit /triples/:triple_id/winners_table_name' do
        # When I visit '/parents/:parent_id/child_table_name'
        # Then I see each Child that is associated with that Parent with each Child's attributes
            it 'sees each winner that is associated with that parent with each winners attributes' do
                visit "/triples/#{@triplecrown.id}/winners_table_name"

                expect(page).to have_content(@secretariat.name)
                expect(page).to have_content(@secretariat.year_won)
                expect(page).to have_content(@secretariat.jockey)
                expect(page).to have_content(@secretariat.trainer)
                expect(page).to have_content(@secretariat.sired_TC_winner)
                expect(page).to have_content(@sirbarton.name)
                expect(page).to have_content(@sirbarton.year_won)
                expect(page).to have_content(@sirbarton.jockey)
                expect(page).to have_content(@sirbarton.trainer)
                expect(page).to have_content(@sirbarton.sired_TC_winner)

                visit "/triples/#{@triplecrown2.id}/winners_table_name"

                expect(page).to have_content(@westaustralian.name)
                expect(page).to have_content(@westaustralian.year_won)
                expect(page).to have_content(@westaustralian.jockey)
                expect(page).to have_content(@westaustralian.trainer)
                expect(page).to have_content(@westaustralian.sired_TC_winner)
                expect(page).to have_content(@rocksand.name)
                expect(page).to have_content(@rocksand.year_won)
                expect(page).to have_content(@rocksand.jockey)
                expect(page).to have_content(@rocksand.trainer)
                expect(page).to have_content(@rocksand.sired_TC_winner)
            end
        end

        describe 'when I visit a triples/winners index page' do
        # When I visit a Parent Children Index page
        # Then I see a link to add a new adoptable child for that parent "Create Child"
        # When I click the link
        # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
        # When I fill in the form with the child's attributes:
        # And I click the button "Create Child"
        # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
        # a new child object/row is created for that parent,
        # and I am redirected to the Parent Childs Index page where I can see the new child listed
            it 'has a link for me to create a new Triple Crown Winner' do
                visit "/triples/#{@triplecrown.id}/winners_table_name"
                click_link 'New Triple Crown Winner'

                expect(current_path).to eq("/triples/#{@triplecrown.id}/winners_table_name/new")
                expect(page).to have_selector(:css, 'form')
            end
        end

        describe 'when I visit the triples winners index page' do
        # When I visit the Parent's children Index Page
        # Then I see a link to sort children in alphabetical order
        # When I click on the link
        # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
            it 'has a link to sort children in alphabetical order' do
                visit "/triples/#{@triplecrown.id}/winners_table_name"
                click_link 'Sort Alphabetically'
                
                expect(@gallantfox.name).to appear_before(@secretariat.name)
                expect(@secretariat.name).to appear_before(@sirbarton.name)
            end
        end
    end
end