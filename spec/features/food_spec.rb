require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(name: 'Test User', email: 'example@gmail.com', password: 'password')
    @food = Food.new(name: 'Test Food', measurement_unit: 'KG', price: 10, user: @user)
  end
  it 'is valid with a name' do
    expect(@food.name).to eq('Test Food')
  end

  it 'belongs to a user' do
    expect(@food.user).to eq(@user)
  end

  it 'has a price' do
    expect(@food.price).to eq(10)
  end

  it 'has a measurement unit' do
    expect(@food.measurement_unit).to eq('KG')
  end
end
