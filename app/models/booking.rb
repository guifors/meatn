class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :groups
  has_many :users, through: :groups

  def full?
    self.groups.count >= 3
  end
end
