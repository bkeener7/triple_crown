require 'rails_helper'

RSpec.describe 'triple/winners index' do
  let(:triplecrown) { Triple.create!(country: 'United States', year_established: 1950, dirt_track: true) }
  let(:triplecrown2) { Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false) }
  let!(:sirbarton) { triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false) }
  let!(:secretariat) { triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false) }
  let!(:westaustralian) { triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false) }
  let!(:rocksand) { triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false) }

  describe 'as a user' do
    it 'allows me to fill attributes for new winner and then create it' do
      visit "/triples/#{triplecrown.id}/winners_table_name/new"

      fill_in('name', with: 'Gallant Fox')
      fill_in('year_won', with: 1930)
      fill_in('jockey', with: 'Earl Sande')
      fill_in('trainer', with: 'Jim Fitzsimmons')
      fill_in('sired_TC_winner', with: true)
      click_button('Create Triple Crown Winner')

      expect(current_path).to eq("/triples/#{triplecrown.id}/winners_table_name")
      expect(page).to have_content('Gallant Fox')
      expect(page).to have_content(1930)
      expect(page).to have_content('Earl Sande')
      expect(page).to have_content('Jim Fitzsimmons')
      expect(page).to have_content(true)
    end
  end
end
