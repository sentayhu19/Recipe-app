class RecipesFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
  validates :food, presence: true
  validates :recipe, presence: true
  validates :quantity, :food_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
