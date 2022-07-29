class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: %i[show edit update destroy]

  # GET /shopping_lists or /shopping_lists.json
  def index
    @recipe = Recipe.find_by(id: params[:recipe_id])
    @recipes_foods = []
    @recipes_foods.each do |recipe_food|
      food = recipe_food
      @recipes_foods << food
    end

    @total_price = 0
    @recipes_foods.each { |item| @total_price += item.quantity * item.food.price }
  end
end
