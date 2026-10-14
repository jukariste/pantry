class Food < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :kcal, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
