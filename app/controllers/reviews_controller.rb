class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    # the review needs a user id - just need to do the reading to figure out how
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.create(review_params)
    if @review.save
			redirect_to restaurant_path(params[:restaurant_id])
		else
      @review.errors.each {|e| puts e}
			render 'new'
		end
  end

  private
	def review_params
		params.require(:review).permit(:comments, :rating)
	end
end
