class Meal < ApplicationRecord
  has_many :meal_foods, dependent: :destroy
  has_many :foods, through: :meal_foods

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def total_kcal
    meal_foods.sum(&:kcal)
  end
end
