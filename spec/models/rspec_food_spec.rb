
require 'rails_helper'

RSpec.describe RecipesFood, type: :model do
  subject do
    user = User.create(name: 'Cedric', email: 'Cedric@example.com', password: 'password', confirmed_at: Time.now)
    recipe = Recipe.create(name: 'Recipe 1', preparation_time: 1, cooking_time: 1, description: 'Recipe 1',
                           public: true, user:)
    food = Food.create(name: 'Food 1', measurement_unit: 'KG', price: 20, user:)
    RecipesFood.new(recipe:, food:, quantity: 5)
  end

  before { subject.save }

  it 'recipe should be present' do
    subject.recipe = nil
    expect(subject).to_not be_valid
  end

  it 'food should be present' do
    subject.food = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be equal to or greater than 1' do
    subject.quantity = 0
    expect(subject).to_not be_valid
  end
end