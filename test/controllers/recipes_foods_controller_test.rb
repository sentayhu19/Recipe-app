require 'test_helper'

class RecipesFoodsControllerTest < ActionDispatch::IntegrationTest
  before do
    @recipes_food = recipes_foods(:one)
  end

  test 'should get index' do
    get recipesFoods_url
    assert_response :success
  end

  test 'should get new' do
    get new_recipesFood_url
    assert_response :success
  end

  test 'should create recipes_food' do
    assert_difference('recipes_foods.count') do
      post recipesFoods_url, params: { recipes_food: {} }
    end

    assert_redirected_to recipesFood_url(RecipesFood.last)
  end

  test 'should show recipes_food' do
    get recipesFood_url(@recipes_food)
    assert_response :success
  end

  test 'should get edit' do
    get edit_recipesFood_url(@recipes_food)
    assert_response :success
  end

  test 'should update recipes_food' do
    patch recipesFood_url(@recipes_food), params: { recipes_food: {} }
    assert_redirected_to recipesFood_url(@recipes_food)
  end

  test 'should destroy recipes_food' do
    assert_difference('recipes_foods.count', -1) do
      delete recipesFood_url(@recipes_food)
    end

    assert_redirected_to recipesFoods_url
  end
end
