require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  before do
    @user = User.create(email: 'abc@123.com', password: '123456')
  end

  it 'is not valid with a name less than 3 chars' do
    restaurant = @user.restaurants.create(name: 'a')
    expect(restaurant).to have(1).error_on :name
    expect(restaurant).not_to be_valid
  end

  it 'is not valid with an existing name' do
    @user.restaurants.create(name: 'a restaurant')
    restaurant = @user.restaurants.create(name: 'a restaurant')
    expect(restaurant).to have(1).error_on :name
    expect(restaurant).not_to be_valid
  end
end
