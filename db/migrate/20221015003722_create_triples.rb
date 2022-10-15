class CreateTriples < ActiveRecord::Migration[5.2]
  def change
    create_table :triples do |t|
      t.string :name
      t.integer :year_commissioned
      t.boolean :us_only

      t.timestamps
    end
  end
end