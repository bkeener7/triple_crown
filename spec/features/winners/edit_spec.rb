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
    it 'fills out the form with updated information and when I click submit, a PATCH request is sent to /parents/:id where the info is updated and I am redirected to show page' do
      visit "/winners_table_name/#{@westaustralian.id}/edit"
      fill_in('name', with: 'Gladiateur')
      fill_in('year_won', with: 1865)
      fill_in('jockey', with: 'Harry Grimshaw')
      fill_in('trainer', with: 'Tom Jennings, Sr.')
      fill_in('sired_TC_winner', with: false)
      click_button('Update Triple Crown Winner')

      expect(current_path).to eq("/winners_table_name/#{@westaustralian.id}")
      expect(page).to have_content('Gladiateur')
      expect(page).to have_content(1865)
      expect(page).to have_content('Harry Grimshaw')
      expect(page).to have_content('Tom Jennings, Sr.')
      expect(page).to have_content(false)
    end
  end
end
