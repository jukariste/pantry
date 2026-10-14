class Food < ApplicationRecord
  has_many :meal_foods, dependent: :restrict_with_error # optional?
  has_many :meals, through: :meal_foods

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :kcal, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
