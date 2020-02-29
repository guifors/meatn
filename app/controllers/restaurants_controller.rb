require 'json'
require 'open-uri'

class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:city].present?
      @restaurants = policy_scope(Restaurant).where("city ILIKE ?", "%#{params[:city]}%")
    elsif
      @search = params["search"]
      @search.present?
      @food_type = @search["food_type"]
      @address = @search["address"]
      @restaurants = policy_scope(Restaurant).where("food_type ILIKE ?", "%#{@food_type}%").where("address ILIKE ?", "%#{@address}%")
      # .where(sql_query, search: "%#{params[:search]}%")
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
    @pictures = fetch_pictures(@restaurant)
  end

  def update
    @restaurant.update(restaurant_params)
  end


  private

  def fetch_pictures(restaurant)
    @url = 'https://developers.zomato.com/api/v2.1/search?apikey=667b536c92ccb5102b2fbffaecf1cc1f&city_id=61'
    @restaurants_serialized = open(@url).read
    @fetched_restaurants = JSON.parse(@restaurants_serialized)
    @fetched_restaurant = @fetched_restaurants["restaurants"].select { |rest| rest["restaurant"]["name"] == restaurant.name }

    return @fetched_restaurant.first["restaurant"]["photos"]

  end

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
        lng: restaurant.longitude,

      }
    end
  end
end
