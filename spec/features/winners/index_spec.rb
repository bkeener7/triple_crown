require 'rails_helper'

RSpec.describe 'winners index' do
  let!(:triplecrown) { Triple.create!(country: 'United States', year_established: 1950, dirt_track: true) }
  let!(:triplecrown2) { Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false) }
  let!(:sirbarton) { triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false) }
  let!(:gallantfox) { triplecrown.winners.create!(name: 'Gallant Fox', year_won: 1930, jockey: 'Earl Sande', trainer: 'Jim Fitzsimmons', sired_TC_winner: true) }
  let!(:secretariat) { triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false) }
  let!(:westaustralian) { triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false) }
  let!(:rocksand) { triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false) }

  describe 'as a user' do
    describe 'when I visit /winners_table_name' do
      it 'sees each winner in the system including the winners attributes' do
        visit '/winners_table_name'

        expect(page).to have_content(gallantfox.name)
        expect(page).to have_content(gallantfox.year_won)
        expect(page).to have_content(gallantfox.jockey)
        expect(page).to have_content(gallantfox.trainer)
        expect(page).to have_content(gallantfox.sired_TC_winner)
      end
    end

    describe 'when I visit any page on the site' do
      it 'sees a link at the top of the page that takes me to the winners index' do
        visit '/triples'
        click_on 'All Triple Crown Winners'
        expect(current_path).to eq('/winners_table_name')

        visit '/winners_table_name'
        click_on 'All Triple Crown Winners'
        expect(current_path).to eq('/winners_table_name')

        visit "/triples/#{triplecrown.id}"
        click_on 'All Triple Crown Winners'
        expect(current_path).to eq('/winners_table_name')

        visit "/winners_table_name/#{secretariat.id}"
        click_on 'All Triple Crown Winners'
        expect(current_path).to eq('/winners_table_name')

        visit "/triples/#{triplecrown.id}/winners_table_name"
        click_on 'All Triple Crown Winners'
        expect(current_path).to eq('/winners_table_name')
      end
    end

    describe 'when I visit the winner index' do
      it 'only sees records where the boolean column is true' do
        visit '/winners_table_name'

        expect(page).to have_content(gallantfox.name)
        expect(page).to have_content(gallantfox.year_won)
        expect(page).to have_content(gallantfox.jockey)
        expect(page).to have_content(gallantfox.trainer)
        expect(page).to have_content(gallantfox.sired_TC_winner)
        expect(page).not_to have_content(sirbarton.name)
        expect(page).not_to have_content(sirbarton.year_won)
        expect(page).not_to have_content(sirbarton.jockey)
        expect(page).not_to have_content(sirbarton.trainer)
        expect(page).not_to have_content(sirbarton.sired_TC_winner)
      end
    end

    describe 'When I visit the winners index page' do
      it 'has a link to edit that triple crown winners info' do
        visit '/winners_table_name'
        click_link "Edit #{gallantfox.name}"

        expect(current_path).to eq("/winners_table_name/#{gallantfox.id}/edit")
      end
    end
  end
end
