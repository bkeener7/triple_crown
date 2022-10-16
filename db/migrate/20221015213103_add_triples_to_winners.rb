class AddTriplesToWinners < ActiveRecord::Migration[5.2]
  def change
    add_reference :winners, :triple, foreign_key: true
  end
end
