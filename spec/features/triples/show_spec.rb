require 'rails_helper'

RSpec.describe 'triples show' do
  let!(:triplecrown) { Triple.create!(country: 'United States', year_established: 1950, dirt_track: true) }
  let!(:triplecrown2) { Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false) }
  let!(:sirbarton) { triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false) }
  let!(:secretariat) { triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false) }
  let!(:westaustralian) { triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false) }
  let!(:rocksand) { triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false) }

  describe 'as a user' do
    describe 'when I visit /triples/:id' do
      it 'sees the triple crown with that id including the triple crown attributes' do
        visit "/triples/#{triplecrown.id}"

        expect(page).to have_content(triplecrown.country)
        expect(page).to have_content(triplecrown.year_established)
        expect(page).to have_content(triplecrown.dirt_track)

        expect(page).not_to have_content(triplecrown2.country)
        expect(page).not_to have_content(triplecrown2.year_established)
        expect(page).not_to have_content(triplecrown2.dirt_track)
      end
    end

    describe 'when I visit triples show page' do
      it 'sees a count of the number of winners associated with this parent' do
        visit "/triples/#{triplecrown.id}"

        expect(page).to have_content(triplecrown.winner_count)
      end
    end

    describe 'when I visit a triples show page /triples/:id' do
      it 'sees a link to take me to the winners winner/table/name page' do
        visit "/triples/#{triplecrown.id}"
        click_on "#{triplecrown.country} Triple Crown Winners"

        expect(current_path).to eq("/triples/#{triplecrown.id}/winners_table_name")
      end
    end
  end
end
