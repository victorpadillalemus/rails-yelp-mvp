class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_strong_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
  end

  # def edit
  # end

  # def update
  #   @restaurant.update(restaurant_strong_params)
  #   redirect_to restaurants_path(@restaurant)
  # end

  # def destroy
  # end

  private

  def restaurant_strong_params
    params.require(:restaurant).permit(:name, :address, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
