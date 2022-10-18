require 'rails_helper'

RSpec.describe 'winners show' do

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
        describe 'when I visit /winners_table_name/:id' do
        # When I visit '/child_table_name/:id'
        # Then I see the child with that id including the child's attributes
            it 'sees the winner with that id including the winner attributes' do
                visit "/winners_table_name/#{@secretariat.id}"

                expect(page).to have_content(@secretariat.name)
                expect(page).to have_content(@secretariat.year_won)
                expect(page).to have_content(@secretariat.jockey)
                expect(page).to have_content(@secretariat.trainer)
                expect(page).to have_content(@secretariat.sired_TC_winner)

                expect(page).to_not have_content(@sirbarton.name)
                expect(page).to_not have_content(@sirbarton.year_won)
                expect(page).to_not have_content(@sirbarton.jockey)
                expect(page).to_not have_content(@sirbarton.trainer)
            end
        end

        describe 'when I visit a winner show page' do
        # When I visit a Child Show page
        # Then I see a link to update that Child "Update Child"
        # When I click the link
        # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
        # When I click the button to submit the form "Update Child"
        # Then a `PATCH` request is sent to '/child_table_name/:id',
        # the child's data is updated,
        # and I am redirected to the Child Show page where I see the Child's updated information
            it 'sees a link to update the winner and redirects to a page to edit with a form' do
                visit "/winners_table_name/#{@westaustralian.id}"
                click_link "Update #{@westaustralian.name} Triple Crown"

                expect(current_path).to eq("/winners_table_name/#{@westaustralian.id}/edit")
                expect(page).to have_selector(:css, 'form')
            end
        end
    end
end