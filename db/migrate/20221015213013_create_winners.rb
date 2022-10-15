class CreateWinners < ActiveRecord::Migration[5.2]
  def change
    create_table :winners do |t|
      t.string :name
      t.integer :year_won
      t.string :jockey
      t.string :trainer
      t.boolean :sired_TC_winner

      t.timestamps
    end
  end
end
