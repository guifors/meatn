class Booking < ApplicationRecord
  belongs_to :restaurant
  has_many :users
end
