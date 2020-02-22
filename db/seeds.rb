# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Restaurant.destroy_all

rest1 = Restaurant.create(name:"The Melody Restaurant at St Paul's Hotel",address:"153 Hammersmith Road",postcode:"W14 0Ql",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",price:1,phone_number:"020-7333-8888")

rest2 = Restaurant.create(name:"SIMYA Korean Restaurant",address:"Broadway Shopping Centre",postcode:"W6 9YE",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"2")

rest3 = Restaurant.create(name:"Toro Gordo Hammersmith",address:"121 King Street",postcode:"W6 9JG",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"3")

rest4 = Restaurant.create(name:"BOMBAY CHOW",address:"220 King Street",postcode:"W6 0RA",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"3")


User.destroy_all

puts "creating some Users"

user1 = User.create(email:"test@test.com", password:"123456")
user2 = User.create(email:"demo@demo.com", password:"123456")
user3 = User.create(email:"chchch@test.com", password:"123456")


Booking.destroy_all

puts "creating some bookings"

Booking.create(title:"Cool Coders of London",date:Faker::Date.between(from: 5.days.ago, to: Date.today), restaurant:rest1, user_id:user1)

Booking.create(title:"Aussies of London",date:Faker::Date.between(from: 5.days.ago, to: Date.today), restaurant:rest2, user_id:user2)

Booking.create(title:"Bookworms of the east",date:Faker::Date.between(from: 5.days.ago, to: Date.today), restaurant:rest3, user_id:user3)
