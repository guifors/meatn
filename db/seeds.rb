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

Booking.destroy_all
User.destroy_all
Restaurant.destroy_all

count = 0
url = "https://developers.zomato.com/api/v2.1/search?apikey=#{ENV['ZOMATO_API_KEY']}&city_id=61&start=#{count}"

restaurants_serialized = open(url).read
fetched_restaurants = JSON.parse(restaurants_serialized)

4.times do

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
            price: restaurant["restaurant"]["price_range"].to_f,
            user_rating: restaurant["restaurant"]["user_rating"]["aggregate_rating"].to_f,
            user_reviews: restaurant["restaurant"]["all_reviews_count"].to_f,
            image_url: restaurant["restaurant"]["featured_image"],
            highlights: restaurant["restaurant"]["highlights"]
          )
  count += 20
  end
end

puts "Restaurants created"


# rest1 = Restaurant.create(name:"The Melody Restaurant at St Paul's Hotel",address:"153 Hammersmith Road",postcode:"W14 0Ql",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",price:1,phone_number:"020-7333-8888",image_url: "https://source.unsplash.com/collection/1353633/")

# rest2 = Restaurant.create(name:"SIMYA Korean Restaurant",address:"Broadway Shopping Centre",postcode:"W6 9YE",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"2",image_url: "https://source.unsplash.com/collection/1353633/")

# rest3 = Restaurant.create(name:"Toro Gordo Hammersmith",address:"121 King Street",postcode:"W6 9JG",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"3",image_url: "https://source.unsplash.com/collection/1353633/")

# rest4 = Restaurant.create(name:"BOMBAY CHOW",address:"220 King Street",postcode:"W6 0RA",city:"London",state:"Middlesex",area:"Hammersmith",country:"UK",phone_number:"020-7333-8888",price:"3",image_url: "https://source.unsplash.com/collection/1353633/")


user_photos = ['https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581176970/nicolas-horn-MTZTGvDsHFY-unsplash_xpfqge.jpg',
  'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581176969/ben-parker-NohB3FJSY90-unsplash_bgq5zz.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581176969/ben-parker-OhKElOkQ3RE-unsplash_cbbhi5.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581176968/luis-villasmil-6qf1uljGpU4-unsplash_xvyzar.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581177724/sarah-brown-tTdC88_6a_I-unsplash_wkvvpl.jpg']


user_filenames = ['nicolas-horn-MTZTGvDsHFY-unsplash_xpfqge.jpg', 'ben-parker-NohB3FJSY90-unsplash_bgq5zz.jpg', 'ben-parker-OhKElOkQ3RE-unsplash_cbbhi5.jpg', 'luis-villasmil-6qf1uljGpU4-unsplash_xvyzar.jpg', 'sarah-brown-tTdC88_6a_I-unsplash_wkvvpl.jpg']


user_emails = ['test@test.com','demo@demo.com', 'bob@bob.com', 'pat@pat.com', 'joe@joe.com']


puts "creating some Users"


counter = 0

5.times do
  user_file = URI.open("#{user_photos[counter]}")
  user = User.create!(email: "#{user_emails[counter]}", password: '123456', name: Faker::Name.first_name, surname: Faker::Name.last_name, bio: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, interests: Faker::TvShows::StrangerThings.quote, age: rand(23..34), location: Faker::Nation.capital_city)
  user.photo.attach(io: user_file, filename: "#{user_filenames[counter]}", content_type: 'image/jpg')
  counter += 1
end

# User.create!(email:"test@test.com", password:"123456", name: Faker::Name.first_name, surname: Faker::Name.last_name )
# User.create(email:"demo@demo.com", password:"123456", name: Faker::Name.first_name, surname: Faker::Name.last_name )
# User.create(email:"chchch@test.com", password:"123456", name: Faker::Name.first_name, surname: Faker::Name.last_name )



puts "creating some bookings"



Booking.create(
  title: "Cool Coders of London",
  date:Faker::Time.between_dates(from: DateTime.now - 4, to: DateTime.now, period: :evening).beginning_of_hour,
  restaurant_id: 1,
  user_id: 1,
  description: "Are you a cool coder and hungry? Join Us!"
  )

Booking.create(title:"Aussies of London", date:Faker::Time.between_dates(from: DateTime.now - 4, to: DateTime.now, period: :afternoon).beginning_of_hour, restaurant_id: 2, user_id: 2, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Tall Trees Society", date:Faker::Time.between_dates(from: DateTime.now - 5, to: DateTime.now, period: :afternoon).beginning_of_hour, restaurant_id: 7, user_id: 2, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Bookworms of the east", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 3, user_id: 3, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Cat lovers", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 4, user_id: 3, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Cheese Aficionados", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 5, user_id: 1, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Made a Moko", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 8, user_id: 3, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Peterborough Poker Sharks", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 16, user_id: 1, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Hoxton Marathon Runners", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 10, user_id: 4, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Richmond Expats", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 14, user_id: 1, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"London Bowlers", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 13, user_id: 1, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Motor Bikers", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 12, user_id: 2, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Stay at home Dads", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :evening).beginning_of_hour, restaurant_id: 1, user_id: 3, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Scotish Teachers", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :afternoon).beginning_of_hour, restaurant_id: 2, user_id: 3, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Tube Travelers", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :afternoon).beginning_of_hour, restaurant_id: 6, user_id: 4, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Star Wars Fans", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :afternoon).beginning_of_hour, restaurant_id: 9, user_id: 4, description: Faker::TvShows::RuPaul.quote)

Booking.create(title:"Fin Tech Friends", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now + 3, period: :afternoon).beginning_of_hour, restaurant_id: 15, user_id: 5, description: Faker::TvShows::RuPaul.quote)

Booking.create(title: "London Ledgends", date: Faker::Time.between_dates(from: Date.today, to: Date.today + 3, period: :afternoon).beginning_of_hour, restaurant_id: 17, user_id: 5, description: Faker::TvShows::RuPaul.quote)

Booking.create(title: "Dog Walkers", date: Faker::Time.between_dates(from: Date.today, to: Date.today + 3, period: :afternoon).beginning_of_hour, restaurant_id: 19, user_id: 2, description: Faker::TvShows::RuPaul.quote)



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

Group.create(booking_id:1 , user_id:2 )

Group.create(booking_id:1 , user_id:3 )

Group.create(booking_id:1 , user_id:4 )

Group.create(booking_id:2 , user_id:3 )

Group.create(booking_id:2 , user_id:4 )

Group.create(booking_id:2 , user_id:5 )

Group.create(booking_id:3 , user_id:4 )

Group.create(booking_id:3 , user_id:4 )

Group.create(booking_id:3 , user_id:1 )

Group.create(booking_id:8 , user_id:3 )

Group.create(booking_id:15 , user_id:4 )

Group.create(booking_id:17 , user_id:5 )

Group.create(booking_id:5 , user_id:5 )

Group.create(booking_id:6 , user_id:4 )

Group.create(booking_id:7 , user_id:2 )

Group.create(booking_id:8 , user_id:3 )

Group.create(booking_id:9 , user_id:3 )

Group.create(booking_id:10 , user_id:4 )

Group.create(booking_id:11 , user_id:5 )

Group.create(booking_id:12 , user_id:3 )

Group.create(booking_id:13 , user_id:3 )

Group.create(booking_id:14 , user_id:5 )

Group.create(booking_id:15 , user_id:5 )

Group.create(booking_id:16 , user_id:4 )

Group.create(booking_id:17 , user_id:4 )

Group.create(booking_id:18 , user_id:3 )

Group.create(booking_id:18 , user_id:5 )





