class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [ :show, :edit, :update]
  skip_before_action :authenticate_user!, only: :index
  def index
    if params[:city].present?
      @restaurants = policy_scope(Restaurant).search_by_city(params[:city])
      authorize @restaurants

    else
      @restaurants = policy_scope(Restaurant)
    end
  end

  def show
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :postcode, :city, :state, :area, :country, :phone_number, :price, :latitude, :longitude, :image_url)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
