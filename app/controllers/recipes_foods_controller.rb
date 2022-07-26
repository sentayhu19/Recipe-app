class RecipesFoodsController < ApplicationController
  before_action :set_recipes_food, only: %i[ show edit update destroy ]

  # GET /recipes_foods or /recipes_foods.json
  def index
    @recipes_foods = RecipesFoods.all
  end

  # GET /recipes_foods/1 or /recipes_foods/1.json
  def show
  end

  # GET /recipes_foods/new
  def new
    @recipes_food = RecipesFoods.new
  end

  # POST /recipes_foods or /recipes_foods.json
  def create
    @recipes_food = RecipesFoods.new(recipes_food_params)

    respond_to do |format|
      if @recipes_food.save
        format.html { redirect_to recipes_food_url(@recipes_food), notice: "Recipes food was successfully created." }
        format.json { render :show, status: :created, location: @recipes_food }
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
      format.html { redirect_to recipes_foods_url, notice: "Recipes food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipes_food
      @recipes_food = RecipesFoods.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipes_food_params
      params.fetch(:recipes_food, {})
    end
end
