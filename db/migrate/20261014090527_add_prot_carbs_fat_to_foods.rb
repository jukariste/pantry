class AddProtCarbsFatToFoods < ActiveRecord::Migration[8.1]
  def change
    add_column :foods, :fat, :float
    add_column :foods, :carbohydrate, :float
    add_column :foods, :protein, :float
  end
end
