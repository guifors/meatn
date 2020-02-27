# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'
require 'open-uri'

Restaurant.destroy_all
url = 'https://developers.zomato.com/api/v2.1/search?apikey=667b536c92ccb5102b2fbffaecf1cc1f&city_id=61'

restaurants_serialized = open(url).read
fetched_restaurants = JSON.parse(restaurants_serialized)

puts fetched_restaurants
puts fetched_restaurants.class
fetched_restaurants["restaurants"].first(100).each do |restaurant|
  rest = Restaurant.create(
            name: restaurant["restaurant"]["name"],
            address: restaurant["restaurant"]["location"]["address"],
            short_address: restaurant["restaurant"]["location"]["locality"],
            city: restaurant["restaurant"]["location"]["city"],
            latitude: restaurant["restaurant"]["location"]["latitude"].to_f,
            longitude: restaurant["restaurant"]["location"]["longitude"].to_f,
            url: restaurant["restaurant"]["url"],
            food_type: restaurant["restaurant"]["cuisines"],
            price: restaurant["restaurant"]["price_range"].to_i,
            user_rating: restaurant["restaurant"]["user_rating"]["aggregate_rating"].to_i,
            user_reviews: restaurant["restaurant"]["all_reviews_count"].to_i,
            image_url: restaurant["restaurant"]["featured_image"],
            highlights: restaurant["restaurant"]["highlights"]
          )
end

puts "100 restaurants created"


# rest1 = Restaurant.create(name:"The Melody Restaurant at St Paul's Hotel",address:"153 Hammersmith Road",postcode:"W14 0Ql",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",price:1,phone_number:"020-7333-8888",image_url: "https://source.unsplash.com/collection/1353633/")

# rest2 = Restaurant.create(name:"SIMYA Korean Restaurant",address:"Broadway Shopping Centre",postcode:"W6 9YE",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"2",image_url: "https://source.unsplash.com/collection/1353633/")

# rest3 = Restaurant.create(name:"Toro Gordo Hammersmith",address:"121 King Street",postcode:"W6 9JG",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"3",image_url: "https://source.unsplash.com/collection/1353633/")

# rest4 = Restaurant.create(name:"BOMBAY CHOW",address:"220 King Street",postcode:"W6 0RA",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"3",image_url: "https://source.unsplash.com/collection/1353633/")


User.destroy_all

puts "creating some Users"

User.create!(email:"test@test.com", password:"123456")
User.create(email:"demo@demo.com", password:"123456")
User.create(email:"chchch@test.com", password:"123456")


Booking.destroy_all

puts "creating some bookings"



Booking.create(
  title:"Cool Coders of London",
  date:Faker::Date.between(from: 5.days.ago, to: Date.today),
  restaurant_id: 1,
  user_id: 1
  )

Booking.create(title:"Aussies of London",date:Faker::Date.between(from: 5.days.ago, to: Date.today), restaurant_id: 2, user_id: 2)

Booking.create(title:"Bookworms of the east",date:Faker::Date.between(from: 5.days.ago, to: Date.today), restaurant_id: 3, user_id: 3)


# name = restaurant["restaurant"]["name"]
# address = restaurant["restaurant"]["location"]["address"]
# short_address = restaurant["restaurant"]["location"]["locality"]
# city = restaurant["restaurant"]["location"]["city"]
# latitude = restaurant["restaurant"]["location"]["latitude"]
# longitude = restaurant["restaurant"]["location"]["longitude"]
# url = restaurant["restaurant"]["url"] # Add as link to user_rating
# food_type = restaurant["restaurant"]["cuisines"]
# price = restaurant["restaurant"]["price_range"]
# user_rating = restaurant["restaurant"]["user_rating"]["aggregate_rating"]
# user_votes = restaurant["restaurant"]["user_rating"]["votes"]
# user_reviews = restaurant["restaurant"]["all_reviews_count"]
# image_url = restaurant["restaurant"]["featured_image"]
# photos = restaurant["restaurant"]["photos"] #["photo"]["thumb_url"]
# highlights = restaurant["restaurant"]["highlights"]








