class CreateMealFoods < ActiveRecord::Migration[8.1]
  def change
    create_table :meal_foods do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true
      t.float :quantity, null: false

      t.timestamps
    end

    # no duplicate foods
    add_index :meal_foods, [ :meal_id, :food_id ], unique: true
  end
end
