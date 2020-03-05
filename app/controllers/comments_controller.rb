class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @booking = Booking.find(params[:booking_id])
    @comment.user_id = current_user.id
    @comment.booking = @booking
    if @comment.save
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
