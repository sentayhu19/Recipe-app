class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: %i[ show edit update destroy ]

  # GET /shopping_lists or /shopping_lists.json
  def index
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipes_foods = []
        @recipes_foods.each do |recipe_food|
          next unless recipe_food.food_id == inventory_food.food_id
          food = recipe_food
          food.quantity -= inventory_food.quantity
          @recipes_foods << food
        end
    
    @total_price = 0
    @recipes_foods.each { |item| @total_price += item.quantity * item.food.price }
  end

end
