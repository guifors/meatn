class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :bio, :text
    add_column :users, :interests, :text
    add_column :users, :age, :integer
    add_column :users, :location, :string
  end
end
