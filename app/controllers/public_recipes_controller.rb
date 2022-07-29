class PublicRecipesController < ApplicationController
  # GET /public_recipes
  def index
    # Should display a list of all public recipes order by newest
    # Should lead to recipes details
    @recipes = Recipe.includes(:user).where(public: true).order(created_at: :desc)
    @recipe_foods = RecipesFoods.includes(:food).where(recipe_id: @recipes.ids)
  end
end
