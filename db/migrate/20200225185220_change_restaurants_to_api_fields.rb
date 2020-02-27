class ChangeRestaurantsToApiFields < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :short_address, :string
    add_column :restaurants, :food_type, :string
    add_column :restaurants, :user_rating, :integer
    add_column :restaurants, :user_votes, :integer
    add_column :restaurants, :user_reviews, :integer
    add_column :restaurants, :highlights, :string
    add_column :restaurants, :url, :string
  end
end


