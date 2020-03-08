class AddBookingToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :booking, foreign_key: true
  end
end
