class PublicRecipesController < ApplicationController
  # GET /public_recipes
  def index
    # Should display a list of all public recipes order by newest
    # Should lead to recipes details
    @recipes = Recipe.where(public: true)
  end
end
