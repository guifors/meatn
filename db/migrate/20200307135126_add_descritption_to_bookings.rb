class AddDescritptionToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :description, :string
  end
end
