class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    authorize @review
    @booking = Booking.find(params[:booking_id])
    @review.user_id = current_user.id
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

