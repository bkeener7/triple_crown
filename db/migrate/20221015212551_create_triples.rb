class CreateTriples < ActiveRecord::Migration[5.2]
  def change
    create_table :triples do |t|
      t.string :country
      t.integer :year_established
      t.boolean :dirt_track

      t.timestamp
    end
  end
end
