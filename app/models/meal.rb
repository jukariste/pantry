class Meal < ApplicationRecord
  has_many :meal_foods, dependent: :destroy
  has_many :foods, through: :meal_foods

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def total_kcal
    meal_foods.sum(&:kcal)
  end

  def total_carbohydrate
    meal_foods.sum(&:carbohydrate)
  end

  def total_fat
    meal_foods.sum(&:fat)
  end

  def total_protein
    meal_foods.sum(&:protein)
  end
end
