# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@triplecrown = Triple.create!(country: 'United States', year_established: 1950, dirt_track: true)
@triplecrown2 = Triple.create!(country: 'United Kingdom', year_established: 1853, dirt_track: false)
@triplecrown3 = Triple.create!(country: 'Canada', year_established: 1959, dirt_track: false)
@triplecrown4 = Triple.create!(country: 'Australia', year_established: 1935, dirt_track: false)
@sirbarton = @triplecrown.winners.create!(name: 'Sir Barton', year_won: 1919, jockey: 'Johnny Loftus', trainer: 'H. Guy Bedwell', sired_TC_winner: false)
@gallantfox = @triplecrown.winners.create!(name: 'Gallant Fox', year_won: 1930, jockey: 'Earl Sande', trainer: 'Jim Fitzsimmons', sired_TC_winner: true)
@secretariat = @triplecrown.winners.create!(name: 'Secretariat', year_won: 1973, jockey: 'Ron Turcotte', trainer: 'Lucien Laurin', sired_TC_winner: false)
@westaustralian = @triplecrown2.winners.create!(name: 'West Australian', year_won: 1853, jockey: 'Frank Butler', trainer: 'John Scott', sired_TC_winner: false)
@gladiateur = @triplecrown2.winners.create!(name: 'Gladiateur', year_won: 1865, jockey: 'Harry Grimshaw', trainer: 'Tom Jennings, Sr.', sired_TC_winner: false)
@rocksand = @triplecrown2.winners.create!(name: 'Rock Sand', year_won: 1903, jockey: 'Danny Maher', trainer: 'George Blackwell', sired_TC_winner: false)
@fakehorse = @triplecrown3.winners.create!(name: 'Not a Real Horse', year_won: 2049, jockey: 'Clint Eastwood', trainer: 'Ronald Reagan', sired_TC_winner: true)
@another_fakehorse = @triplecrown4.winners.create!(name: 'Also Not a Real Horse', year_won: 2999, jockey: 'Philip J. Fry', trainer: 'Head of Richard Nixon', sired_TC_winner: true)
