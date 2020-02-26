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

Restaurant.create!(name:"The Melody Restaurant at St Paul's Hotel",address:"153 Hammersmith Road",postcode:"W14 0Ql",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",price:1,phone_number:"020-7333-8888",image_url: "https://source.unsplash.com/collection/1353633/")

Restaurant.create(name:"SIMYA Korean Restaurant",address:"Broadway Shopping Centre",postcode:"W6 9YE",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"2",image_url: "https://source.unsplash.com/collection/1353633/")

Restaurant.create(name:"Toro Gordo Hammersmith",address:"121 King Street",postcode:"W6 9JG",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"3",image_url: "https://source.unsplash.com/collection/1353633/")

Restaurant.create(name:"BOMBAY CHOW",address:"220 King Street",postcode:"W6 0RA",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"3",image_url: "https://source.unsplash.com/collection/1353633/")


User.destroy_all

puts "creating some Users"

User.create!(email:"test@test.com", password:"123456")
User.create(email:"demo@demo.com", password:"123456")
User.create(email:"chchch@test.com", password:"123456")


Booking.destroy_all

puts "creating some bookings"

Booking.create!(title:"Cool Coders of London", date:Faker::Date.between(from: 5.days.ago, to: Date.today), restaurant_id: 1, user_id: 1)

Booking.create!(title:"Aussies of London", date:Faker::Date.between(from: 5.days.ago, to: Date.today), restaurant_id: 2, user_id: 2)

Booking.create!(title:"Bookworms of the east", date:Faker::Date.between(from: 5.days.ago, to: Date.today), restaurant_id: 3, user_id: 3)


puts "All good"

# url = 'https://developers.zomato.com/api/v2.1/search?apikey=667b536c92ccb5102b2fbffaecf1cc1f&city_id=61'

# restaurants_serialized = open(url).read
# restaurants = JSON.parse(restaurants_serialized)

# first_restaurant = restaurants["restaurants"].first

# name = first_restaurant["restaurant"]["name"]
# address = first_restaurant["restaurant"]["location"]["address"]
# short_address = first_restaurant["restaurant"]["location"]["locality"]
# city = first_restaurant["restaurant"]["location"]["city"]
# latitude = first_restaurant["restaurant"]["location"]["latitude"]
# longitude = first_restaurant["restaurant"]["location"]["longitude"]
# url = first_restaurant["restaurant"]["url"] # Add as link to user_rating
# food_type = first_restaurant["restaurant"]["cuisines"]
# price = first_restaurant["restaurant"]["price_range"]
# user_rating = first_restaurant["restaurant"]["user_rating"]["aggregate_rating"]
# user_votes = first_restaurant["restaurant"]["user_rating"]["votes"]
# user_reviews = first_restaurant["restaurant"]["all_reviews_count"]
# image_url = first_restaurant["restaurant"]["featured_image"]
# photos = first_restaurant["restaurant"]["photos"] #["photo"]["thumb_url"]
# highlights = first_restaurant["restaurant"]["highlights"]







