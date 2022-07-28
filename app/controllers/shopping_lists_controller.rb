class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: %i[ show edit update destroy ]

  # GET /shopping_lists or /shopping_lists.json
  def index
    @recipes = Recipe.includes(:recipeFoods).where(public: true)
  end

end
