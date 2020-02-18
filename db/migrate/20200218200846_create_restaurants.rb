class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :city
      t.string :state
      t.string :area
      t.string :country
      t.string :phone_number
      t.integer :price
      t.float :latitude
      t.float :longitude
      t.string :image_url

      t.timestamps
    end
  end
end
