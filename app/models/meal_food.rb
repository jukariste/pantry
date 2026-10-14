class MealFood < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :food_id, uniqueness: { scope: :meal_id }

  # quantity is unit of food, where 1 unit of food is assumed to be per 100g
  # change if dumb (divide by 100)
  def kcal
    food.kcal * quantity
  end
end
