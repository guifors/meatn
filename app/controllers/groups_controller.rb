class GroupsController < ApplicationController
  def new
    @group = Group.new
    authorize @group
  end

  def create
    @group = Group.new(booking_id: params[:booking_id])
    @group.user = current_user
    @booking = Booking.find(params[:booking_id])
    authorize @group
    if @group.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end
end
