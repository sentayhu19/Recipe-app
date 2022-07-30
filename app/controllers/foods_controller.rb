class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # POST /foods or /foods.json
  def create
    user = current_user
    @food = Food.new(food_params)
    @food.user = user

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    user = current_user
    food = Food.find_by(id: params[:id])
    if food.present?
      if food.destroy
        flash[:notice] = 'Food was successfully deleted'
      else
        flash[:alert] = 'Food was not deleted, please try again later.'
      end
    else
      flash[:alert] = 'Food was not found, please try again later.'
    end
    redirect_to foods_path(user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
