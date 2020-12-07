class CreateFavoriteCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_counts do |t|
      t.integer :count
      t.references :expense,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
