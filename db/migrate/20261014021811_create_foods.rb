class CreateFoods < ActiveRecord::Migration[8.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.float :kcal, null: false

      t.timestamps
    end

    add_index :foods, :name, unique: true
  end
end
