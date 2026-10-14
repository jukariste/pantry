class AddProtCarbsFatToFoods < ActiveRecord::Migration[8.1]
  def change
    add_column :foods, :fat, :float, default: 0
    add_column :foods, :carbohydrate, :float, default: 0
    add_column :foods, :protein, :float, default: 0
  end
end
