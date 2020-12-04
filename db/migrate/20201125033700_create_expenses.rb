class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :income,            null: false
      t.integer :food_expense
      t.integer :necessities
      t.integer :clothes_expense
      t.integer :beauty_expense
      t.integer :entertainment_expense
      t.integer :medical_bill
      t.integer :education_cost
      t.integer :utility_costs
      t.integer :traveling_expense
      t.integer :other
      t.text :memo
      t.boolean :checked
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
