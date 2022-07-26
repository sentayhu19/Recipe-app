class Recipe < ApplicationRecord
  belongs_to :users, class_name: User, foreign_key: :user_id
  has_many :foods, :through => :recipes_foods
end
