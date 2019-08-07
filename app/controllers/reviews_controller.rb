class ReviewsController < ApplicationController
# before_action :set_review, only: [:new]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_strong_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  def review_strong_params
    params.require(:review).permit(:content, :rating)
  end

  # def set_review
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end
end
