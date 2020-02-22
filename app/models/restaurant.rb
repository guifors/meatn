class Restaurant < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city ],
    using: {
      tsearch: { prefix: true }
  }
  has_many :bookings
end
