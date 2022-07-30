class RecipesFoodsController < ApplicationController
  before_action :set_recipes_food, only: %i[show edit update destroy]

  # GET /recipes_foods or /recipes_foods.json
  def index
    @recipes_foods = RecipesFood.all
  end

  # GET /recipes_foods/1 or /recipes_foods/1.json
  def show; end

  # GET /recipes_foods/new
  def new
    @recipes_food = RecipesFood.new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where(user_id: current_user.id)
  end

  # POST /recipes_foods or /recipes_foods.json
  def create
    @foods = Food.where(user_id: current_user.id)
    @food = Food.find(recipes_food_params['food'])
    @recipe = Recipe.find(params[:recipe_id])
    @recipes_food = RecipesFood.new(quantity: recipes_food_params['quantity'].to_i, food: @food, recipe: @recipe)

    respond_to do |format|
      if @recipes_food.save
        format.html { redirect_to recipes_path, notice: 'Recipes food was successfully created.' }
        format.json { render :show, status: :created, location: @recipes_foods }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipes_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes_foods/1 or /recipes_foods/1.json
  def destroy
    @recipes_food.destroy

    respond_to do |format|
      format.html { redirect_to recipesFoods_url, notice: 'Recipes food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipes_food
    @recipes_food = RecipesFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipes_food_params
    params.require(:recipes_food).permit(:food, :quantity)
  end
end
