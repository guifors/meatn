class Restaurant < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [ :city ],
    using: {
      tsearch: { prefix: true }
  }

  pg_search_scope :global_search,
    against: [ :city, :price ],
    using: {
      tsearch: { prefix: true }
  }


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :bookings
end
