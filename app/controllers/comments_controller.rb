class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @booking = Booking.find(params[:booking_id])
    @comment.user_id = current_user.id
    @comment.booking = @booking
    if @comment.save
      respond_to do |format|
        format.html { redirect_to booking_path(@booking) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.js  # <-- idem
      end
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
