require 'rails_helper'

RSpec.describe 'winners show' do
  let!(:triplecrown) { Triple.create!(country: 'United States', year_established: 1950, dirt_track: true) }
  let!(:triplecrown2) { Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false) }
  let!(:sirbarton) { triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false) }
  let!(:secretariat) { triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false) }
  let!(:westaustralian) { triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false) }
  let!(:rocksand) { triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false) }

  describe 'as a user' do
    describe 'when I visit /winners_table_name/:id' do
      it 'sees the winner with that id including the winner attributes' do
        visit "/winners_table_name/#{secretariat.id}"

        expect(page).to have_content(secretariat.name)
        expect(page).to have_content(secretariat.year_won)
        expect(page).to have_content(secretariat.jockey)
        expect(page).to have_content(secretariat.trainer)
        expect(page).to have_content(secretariat.sired_TC_winner)

        expect(page).not_to have_content(sirbarton.name)
        expect(page).not_to have_content(sirbarton.year_won)
        expect(page).not_to have_content(sirbarton.jockey)
        expect(page).not_to have_content(sirbarton.trainer)
      end
    end

    describe 'when I visit a winner show page' do
      it 'sees a link to update the winner and redirects to a page to edit with a form' do
        visit "/winners_table_name/#{westaustralian.id}"
        click_link "Update #{westaustralian.name} Triple Crown"

        expect(current_path).to eq("/winners_table_name/#{westaustralian.id}/edit")
        expect(page).to have_selector(:css, 'form')
      end
    end
  end
end
