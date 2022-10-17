require 'rails_helper'

RSpec.describe 'triples edit' do

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
        describe 'when I visit a triples show page' do
        # When I visit a parent show page
        # Then I see a link to update the parent "Update Parent"
        # When I click the link "Update Parent"
        # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
        # When I fill out the form with updated information
        # And I click the button to submit the form
        # Then a `PATCH` request is sent to '/parents/:id',
        # the parent's info is updated,
        # and I am redirected to the Parent's Show page where I see the parent's updated info
            it 'sees a link to update the triples Update Triple, when I clink the link I am taken to /triples/:id/edit where I see a form to edit triples attributes' do
                visit "/triples/#{@triplecrown.id}"
                click_link "Update #{@triplecrown.country} Triple Crown" 

                expect(current_path).to eq("/triples/#{@triplecrown.id}/edit")
                expect(page).to have_selector(:css, 'form')
            end

            it 'fills out the form with updated information and when I click submit, a PATCH request is sent to /parents/:id where the info is updated and I am redirected to show page' do
                visit "/triples/#{@triplecrown.id}/edit"
                fill_in('country', with: 'New Zealand')
                fill_in('year_established', with: 2019)
                fill_in('dirt_track', with: false)
                click_button('Update Triple Crown Series')
                save_and_open_page

                expect(current_path).to eq("/triples/#{@triplecrown.id}")
                expect(page).to have_content('New Zealand')
                expect(page).to have_content('2019')
                expect(page).to have_content('false')                
            end
        end
    end
end