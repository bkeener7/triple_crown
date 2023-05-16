require 'rails_helper'

RSpec.describe 'winners index' do
  let!(:triplecrown) { Triple.create!(country: 'United States', year_established: 1950, dirt_track: true) }
  let!(:triplecrown2) { Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false) }
  let!(:sirbarton) { triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false) }
  let!(:gallantfox) { triplecrown.winners.create!(name: 'Gallant Fox', year_won: 1930, jockey: 'Earl Sande', trainer: 'Jim Fitzsimmons', sired_TC_winner: true) }
  let!(:secretariat) { triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false) }
  let!(:westaustralian) { triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false) }
  let!(:rocksand) { triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false) }

  it 'can destroy winner records' do
    visit '/winners_table_name'
    expect(page).to have_content(gallantfox.name)

    visit "/winners_table_name/#{gallantfox.id}"
    expect(page).to have_button("Delete #{gallantfox.name}")

    click_button "Delete #{gallantfox.name}"

    expect(current_path).to eq('/winners_table_name')
    expect(page).to_not have_content('Gallant Fox')
  end

  it 'can delete winners from winner index page' do
    visit '/winners_table_name'
    expect(page).to have_button("Delete #{gallantfox.name}")

    click_button "Delete #{gallantfox.name}"

    expect(current_path).to eq('/winners_table_name')
    expect(page).to_not have_content('Gallant Fox')
  end
end
