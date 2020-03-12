class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index

    if params[:city].present? && params[:date].present?

      @bookings = policy_scope(Booking).search_by_date(params[:date].to_date).joins(:restaurant).where("restaurants.city ILIKE ?", "%#{params[:city]}%")
    elsif
      @search = params["search"]
      @food_type = @search["food_type"]
      @address = @search["address"]
      @date = @search["date"]



      @bookings = policy_scope(Booking).search_by_date(@date.to_date).joins(:restaurant).where("restaurants.address ILIKE ?", "%#{@address}%").where("restaurants.food_type ILIKE ?", "%#{@food_type}%")
    else
      @bookings = policy_scope(Booking)
    end
    authorize @bookings
    @markers = @bookings.map do |booking|
      {
        lat: booking.restaurant.latitude,
        lng: booking.restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { booking: booking })
      }
  end

  end

  def show
    set_booking
    @user = set_booking.user
    @users = set_booking.users
    set_restaurant
    authorize @booking
    @review = Review.new
    @comment = Comment.new
    # @pictures = fetch_pictures(set_restaurant)

  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.restaurant = Restaurant.find(params[:restaurant_id])
    authorize @booking
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(bookings_params)
  end

  private

  def fetch_pictures(restaurant)
    @url = "https://developers.zomato.com/api/v2.1/search?apikey=#{ENV['ZOMATO_API_KEY']}&city_id=61"
    @restaurants_serialized = open(@url).read
    @fetched_restaurants = JSON.parse(@restaurants_serialized)
    @fetched_restaurant = @fetched_restaurants["restaurants"].select { |rest| rest["restaurant"]["name"] == restaurant.name }

    return @fetched_restaurant.first["restaurant"]["photos"]

  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_restaurant
    @restaurant = @booking.restaurant
  end

end
