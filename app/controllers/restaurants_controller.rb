class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:city].present?
      @restaurants = policy_scope(Restaurant).search_by_city(params[:city])
    else
      @restaurants = policy_scope(Restaurant).geocoded
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
    authorize @restaurant
    @booking = Booking.new
  end

  def update
    @restaurant.update(restaurant_params)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :postcode, :city, :state, :area, :country, :phone_number, :price, :latitude, :longitude, :image_url)
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
