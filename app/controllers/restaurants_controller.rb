class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:city].present?
      @restaurants = Restaurant.search_by_address(params[:city])
    else
      @restaurants = Restaurant.geocoded
    end
    set_markers
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @booking = Booking.new
  end

  def update
    @restaurant.update(restaurant_params)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:user, :address, :guests, :beds, :bedrooms, :description, :price_per_night, :title, photos: [])
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def set_markers
    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end
end
