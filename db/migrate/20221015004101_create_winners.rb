class CreateWinners < ActiveRecord::Migration[5.2]
  def change
    create_table :winners do |t|
      t.string :name
      t.integer :year_won
      t.string :jockey
      t.string :trainer
      t.integer :kentucky_derby_time
      t.integer :preakness_stakes_time
      t.integer :belmont_stakes_time
      t.boolean :sired_TC_winner
      t.references :triple, foreign_key: true

      t.timestamps
    end
  end
end
