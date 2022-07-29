require 'rails_helper'

RSpec.describe RecipesFood, type: :model do
  before(:each) do
    @user = User.new(name: 'Cedric', email: 'Cedric@gmail.com', password: 'password')
    @recipe = Recipe.new(name: 'Test Recipe', user: @user)
    @recipe_food = RecipesFood.new(recipe: @recipe, food: Food.new(name: 'Test Food', user: @user), quantity: 10)
  end

  it 'belongs to a user' do
    expect(@recipe_food.recipe_id).to eq(@user.id)
  end

  it 'belongs to a recipe' do
    expect(@recipe_food.recipe).to eq(@recipe)
  end

  it 'belongs to a food' do
    expect(@recipe_food.food).to eq(@recipe_food.food)
  end

  it 'has a quantity' do
    expect(@recipe_food.quantity).to eq(10)
  end
end