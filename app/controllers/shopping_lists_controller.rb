class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: %i[show edit update destroy]

  # GET /shopping_lists or /shopping_lists.json
  def index
    @foods = Food.includes(:recipes_foods).where(recipes_foods: { food_id: nil })
    @recipes_foods = []
    @foods.each do |recipe_food|
      food = recipe_food
      food.quantity = Random.rand(1..10).to_i
      @recipes_foods << food
    end

    @total_price = 0
    @recipes_foods.each { |item| @total_price += item.quantity * item.price }
  end
end
