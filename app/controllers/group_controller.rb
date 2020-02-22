class GroupController < ApplicationController
  def new
    @group = Group.new
    authorize @group
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    @booking = Booking.find(params[:booking_id])
    @group.booking = @booking
    if @group.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end
end
