require 'rails_helper'

RSpec.describe 'triples destroy' do
  before :each do
    @triplecrown = Triple.create!(country: 'United States', year_established: 1950, dirt_track: true)
    @triplecrown2 = Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false)
    @sirbarton = @triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false)
    @secretariat = @triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false)
    @westaustralian = @triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false)
    @rocksand = @triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false)
  end

  describe 'as a user' do
    it 'can delete triples from the triple crown id page' do
      triplecrown3 = Triple.create!(country: 'Canada', year_established: 1959, dirt_track: false)

      visit '/triples'
      expect(page).to have_content('Canada')

      visit "/triples/#{triplecrown3.id}"
      expect(page).to have_button("Delete #{triplecrown3.country} Triple Crown")

      click_button "Delete #{triplecrown3.country} Triple Crown"

      expect(current_path).to eq('/triples')
      expect(page).to_not have_content('Canada')
    end

    it 'also deletes triples with their winners' do
      visit "/triples/#{@triplecrown2.id}"

      click_button "Delete #{@triplecrown2.country} Triple Crown"

      visit '/triples'
      expect(page).to_not have_content('United Kingdom')
    end

    it 'can delete triples from the triple crown index page' do
      visit '/triples'

      expect(page).to have_button("Delete #{@triplecrown.country} Triple Crown")

      click_button "Delete #{@triplecrown.country} Triple Crown"

      expect(current_path).to eq('/triples')
      expect(page).to_not have_content(@triplecrown.country)
    end
  end
end
