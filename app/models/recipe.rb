class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods, through: :recipes_foods
end
