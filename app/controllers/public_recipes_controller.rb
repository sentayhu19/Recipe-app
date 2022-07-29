class PublicRecipesController < ApplicationController
  # GET /public_recipes
  def index
    # Should display a list of all public recipes order by newest
    # Should lead to recipes details
    @recipes = Recipe.includes(:user).where(public: true).where.not(user_id: current_user.id).order(created_at: :desc)
    @foods = RecipesFood.joins(:recipe, :food)
    unless @foods.empty?
      @user = User.find(Food.find(@foods[0]['food_id'])['user_id'])
      @total_price = 0
      @foods.each do |food|
        f = Food.find(food.food_id)
        @total_price += (f.price.to_i * food.quantity)
      end
    end
  end
end
