class Booking < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user
  has_many :groups
  has_many :users, through: :groups
  has_many :comments

  has_many :reviews

  validates :date, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_date,
    against: [ :date ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def full?
    self.groups.count >= 3
  end

  def attendees?
    self.groups.count + 1
  end
end
