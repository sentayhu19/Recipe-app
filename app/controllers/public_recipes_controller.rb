class PublicRecipesController < ApplicationController
  # GET /public_recipes
  def index
    # Should display a list of all public recipes order by newest
    # Should lead to recipes details
    @recipes = Recipe.includes(:user).where(public: true).where.not(user_id: current_user.id).order(created_at: :desc)
    p @recipes
    return if @recipes.empty?
    @public_recipes = []
    @recipes.each do |recipe|
      recipe_food = RecipesFood.where(recipe_id: recipe.id)
      p recipe_food
      next if recipe_food.empty?

      food_items = recipe_food[0].quantity
      food = Food.find(recipe_food[0].food_id)
      author = User.find(food.user_id)
      total_price = food.price * food_items
      public_recipe = {
        id: recipe.id,
        recipe_name: recipe.name,
        author: author,
        food_items: food_items,
        total_price: total_price,
      }
      p public_recipe
      @public_recipes << public_recipe
    end

    # @foods = RecipesFood.joins(:recipe, :food)
    # @user = @recipes.user
    # @total_price = 0
    # @foods.each do |food|
    #   f = Food.find(food.food_id)
    #   @total_price += (f.price.to_i * food.quantity)
    # end
  end
end
