require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  # before do
  #   @user = User.create(email: 'abc@123.com', password: '123456')
  # end

  it 'is not valid with a name less than 3 chars' do
    restaurant = Restaurant.create(name: 'a')
    expect(restaurant).to have(1).error_on :name
    expect(restaurant).not_to be_valid
  end

  it 'is not valid with an existing name' do
    Restaurant.create(name: 'a restaurant')
    restaurant = Restaurant.create(name: 'a restaurant')
    expect(restaurant).to have(1).error_on :name
    expect(restaurant).not_to be_valid
  end

  describe 'reviews' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:restaurant) { Restaurant.create name: 'Test' }
      let(:review_params) { {rating: 5, comments: 'yum'} }

      subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

      it 'builds a review' do
        expect(review).to be_a Review
      end

      it 'builds a review associated with the specified user' do
        expect(review.user).to eq user
      end
    end

    describe '#average_rating' do
      context 'no reviews' do
        it 'returns "N/A" when there are no reviews' do
          restaurant = Restaurant.create(name: 'The Ivy')
          expect(restaurant.average_rating).to eq 'N/A'
        end
      end

      context '1 review' do
        it 'returns that rating' do
          restaurant = Restaurant.create(name: 'The Ivy')
          restaurant.reviews.create(rating: 4)
          expect(restaurant.average_rating).to eq 4
        end
      end

      context 'multiple reviews' do
        it 'returns the average' do
          restaurant = Restaurant.create(name: 'The Ivy')
          restaurant.reviews.create(rating: 1)
          restaurant.reviews.create(rating: 5)
          expect(restaurant.average_rating).to eq 3
        end
      end
    end
  end

end
