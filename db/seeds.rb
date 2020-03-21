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

# Falta
# Add user 1 and 2 (demoers)
# Distinguish between masculin and feminin user names
# Make sure you dont generate bookings with 4 Users
# Make THE booking you will use for the demo

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


user_photos = [
  'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584777991/GF_dwhnug.jpg',
  'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584778056/Screenshot_2020-03-21_at_08.07.14_dg6avk.png',
  'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581176970/nicolas-horn-MTZTGvDsHFY-unsplash_xpfqge.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581177724/sarah-brown-tTdC88_6a_I-unsplash_wkvvpl.jpg',
  'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581176969/ben-parker-NohB3FJSY90-unsplash_bgq5zz.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581176969/ben-parker-OhKElOkQ3RE-unsplash_cbbhi5.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1600,h_1600,c_crop,g_face,r_max/w_400/v1581176968/luis-villasmil-6qf1uljGpU4-unsplash_xvyzar.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862918/caleb-lucas-6rRuAqtWt60-unsplash_m1thvm.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862923/masha-rostovskaya-yVNsYeGsZfs-unsplash_pzwpnf.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862860/svetlana-pochatun-ADO--iIOczk-unsplash_yltdp3.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862824/daniil-lobachev-9zFrKoT1mMA-unsplash_n2brz0.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862761/esther-ann-lORFt5nxAbk-unsplash_e6u8jr.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862909/sincerely-media-_iIB6g19mq4-unsplash_rdfxvj.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_16:9,c_fill,g_auto,e_sharpen/v1583862920/tyler-nix-8youKEwX0vY-unsplash_wtwd5t.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862919/toa-heftiba--G9DNKx00ew-unsplash_pyqnv3.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862916/yogendra-singh-Sx00bDu24_k-unsplash_lqoybv.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862780/jiangxulei1990-U3G3ed8-BT4-unsplash_aoq5ap.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862752/angelika-agibalova-06Bl5S7tySM-unsplash_gwdszt.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862811/joanna-nix-h2pnXHMz8YM-unsplash_qnmhsb.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/v1583862824/petr-sevcovic-auCjz0gucr0-unsplash_dkmbk2.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862837/clem-onojeghuo-FbTOrJ2G8KI-unsplash_f4oewr.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046096/dan-ROJFuWCsfmA-unsplash_rc7ayo.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046085/jason-blackeye-R5rVLQZ8hG8-unsplash_wp5jgt.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046077/emile-guillemot-LSP9Tpavbms-unsplash_a4qtwn.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046074/stefan-stefancik-w_Mj-SsE1mI-unsplash_c3q8lf.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1583862829/ronise-da-luz-5DJ8sR-m58I-unsplash_t4salr.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046343/ethan-hoover-0YHIlxeCuhg-unsplash_qqabab.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046424/dan-ROJFuWCsfmA-unsplash_jz3a5q.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046408/luis-villasmil-hh3ViD0r0Rc-unsplash_vtwdqw.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046348/kelly-sikkema-JN0SUcTOig0-unsplash_vuurel.jpg',
'https://res.cloudinary.com/ddhmqwylk/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1584046441/sergio-de-paula-c_GmwfHBDzk-unsplash_xypsyr.jpg'

]


user_filenames = [
  'GF_dwhnug.jpg',
  'Screenshot_2020-03-21_at_08.07.14_dg6avk.png',
  'nicolas-horn-MTZTGvDsHFY-unsplash_xpfqge.jpg',
  'sarah-brown-tTdC88_6a_I-unsplash_wkvvpl.jpg',
  'ben-parker-NohB3FJSY90-unsplash_bgq5zz.jpg',
  'ben-parker-OhKElOkQ3RE-unsplash_cbbhi5.jpg',
  'luis-villasmil-6qf1uljGpU4-unsplash_xvyzar.jpg',
  'caleb-lucas-6rRuAqtWt60-unsplash_m1thvm.jpg',
  'masha-rostovskaya-yVNsYeGsZfs-unsplash_pzwpnf.jpg',
  'svetlana-pochatun-ADO--iIOczk-unsplash_yltdp3.jpg',
  'daniil-lobachev-9zFrKoT1mMA-unsplash_n2brz0.jpg',
  'esther-ann-lORFt5nxAbk-unsplash_e6u8jr.jpg',
  'sincerely-media-_iIB6g19mq4-unsplash_rdfxvj.jpg',
  'tyler-nix-8youKEwX0vY-unsplash_wtwd5t.jpg',
  'toa-heftiba--G9DNKx00ew-unsplash_pyqnv3.jpg',
  'yogendra-singh-Sx00bDu24_k-unsplash_lqoybv.jpg',
  'jiangxulei1990-U3G3ed8-BT4-unsplash_aoq5ap.jpg',
  'angelika-agibalova-06Bl5S7tySM-unsplash_gwdszt.jpg',
  'joanna-nix-h2pnXHMz8YM-unsplash_qnmhsb.jpg',
  'petr-sevcovic-auCjz0gucr0-unsplash_dkmbk2.jpg',
  'clem-onojeghuo-FbTOrJ2G8KI-unsplash_f4oewr.jpg',
  'dan-ROJFuWCsfmA-unsplash_rc7ayo.jpg',
  'jason-blackeye-R5rVLQZ8hG8-unsplash_wp5jgt.jpg',
  'emile-guillemot-LSP9Tpavbms-unsplash_a4qtwn.jpg',
  'stefan-stefancik-w_Mj-SsE1mI-unsplash_c3q8lf.jpg',
  'ronise-da-luz-5DJ8sR-m58I-unsplash_t4salr.jpg',
  'ethan-hoover-0YHIlxeCuhg-unsplash_qqabab.jpg',
  'dan-ROJFuWCsfmA-unsplash_jz3a5q.jpg',
  'luis-villasmil-hh3ViD0r0Rc-unsplash_vtwdqw.jpg',
  'kelly-sikkema-JN0SUcTOig0-unsplash_vuurel.jpg',
  'sergio-de-paula-c_GmwfHBDzk-unsplash_xypsyr.jpg'
]


user_emails = [
  'test@test.com',
  'demo@demo.com',
  'bob@bob.com',
  'pat@pat.com',
  'joe@joe.com',
  'lucas@lucas.com',
  'masha@masha.com',
  'svetlana@svetlana.com',
  'daniil@daniil.com',
  'esther@esther.com',
  'sincere@sincere.com',
  'tyler@tyler.com',
  'toa@toa.com',
  'yogendra@yogendra.com',
  'jian@jian.com',
  'angelika@angelika.com',
'joanna@joanna.com',
'petr@petr.com',
'clem@clem.com',
'dan@dan.com',
'jason@jason.com',
'emile@emile.com',
'stefan@stefan.com',
'ronise@ronise.com',
'ethan@ethan.com',
'dantwo@dantwo.com',
'luis@luis.com',
'kelly@kelly.com',
'sergio@sergio.com',
'additional@additional.com',
'additionalbis@additionalbis.com',
'additionalbisbis@additionalbisbis.com',
'additionalbisbis@additionalbisbis.com' ]


puts "creating some Users"

# Users for demo

user_one_file = URI.open("#{user_photos[0]}")
  user_one = User.new(email: "#{user_emails[0]}", password: '123456', name: "Guillermo", surname: "Forteza", bio: "Currently working as part of the Corporate Innovation unit of a large multinational in the mobility industry. Big fan of brunch and trying out the many cafes in Richmond. Just moved to London from Spain", interests: "Innovation, Sport Cars and good coffee", age: "33", location: "Valencia")
  user_one.photo.attach(io: user_one_file, filename: "#{user_filenames[0]}", content_type: 'image/jpg')
  user_one.save!

user_two_file = URI.open("#{user_photos[1]}")
  user_two = User.new(email: "#{user_emails[1]}", password: '123456', name: "Tom", surname: "Hudson", bio: "I’m an innovation and digital strategy consultant for a tech company. The highlight of my week is on the weekend when I’m going for a long bike ride. Just moved to London and keen to know some good cycle routes.", interests: "Tech for good, cycling and foraging for mushrooms.", age: "30", location: "Bristol")
  user_two.photo.attach(io: user_two_file, filename: "#{user_filenames[1]}", content_type: 'image/jpg')
  user_two.save!

  user_two_file = URI.open("#{user_photos[2]}")
  user_two = User.new(email: "#{user_emails[2]}", password: '123456', name: "Marco", surname: "Rigamonti", bio: "Hi I’m Italian and I’ve been living in Manchester for the last 3 years. I’ve just moved down to London to join a tech-ed company, I use to work in the hospitality sector but decided to change careers a few years ago. I now work as a developer and love it!", interests: "Football, 80’s Rap and Italian food", age: "28", location: "Rome")
  user_two.photo.attach(io: user_two_file, filename: "#{user_filenames[1]}", content_type: 'image/jpg')
  user_two.save!

  user_two_file = URI.open("#{user_photos[3]}")
  user_two = User.new(email: "#{user_emails[3]}", password: '123456', name: "Julia", surname: "Roberts", bio: "Hi! I work in the movies industry in marketing and communication. I’ve recently moved to London from LA - bring back the sunshine! Currently honing my tech skills in order to explore new career paths.", interests: "Indie Films, Travel and brunchIndie Films, Travel and brunch", age: "32", location: "Los Angeles")
  user_two.photo.attach(io: user_two_file, filename: "#{user_filenames[1]}", content_type: 'image/jpg')
  user_two.save!

# Other users

counter = 4

25.times do
  user_file = URI.open("#{user_photos[counter]}")
  user = User.new(email: "#{user_emails[counter]}", password: '123456', name: Faker::Name.first_name, surname: Faker::Name.last_name, bio: Faker::Movies::HitchhikersGuideToTheGalaxy.marvin_quote, interests: Faker::TvShows::StrangerThings.quote, age: rand(23..34), location: Faker::Nation.capital_city)
  user.photo.attach(io: user_file, filename: "#{user_filenames[counter]}", content_type: 'image/jpg')
  user.save!

  counter += 1
end

# User.create!(email:"test@test.com", password:"123456", name: Faker::Name.first_name, surname: Faker::Name.last_name )
# User.create(email:"demo@demo.com", password:"123456", name: Faker::Name.first_name, surname: Faker::Name.last_name )
# User.create(email:"chchch@test.com", password:"123456", name: Faker::Name.first_name, surname: Faker::Name.last_name )



puts "creating some bookings"


# Other bookings past

b_1 = Booking.create!(title:"Aussies of London", date:Faker::Time.between_dates(from: DateTime.now - 4, to: DateTime.now - 1, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[1], user: User.all.order("id ASC")[0], description: Faker::TvShows::RuPaul.quote)

b_2 = Booking.create!(title:"Tall Trees Society", date:Faker::Time.between_dates(from: DateTime.now - 5, to: DateTime.now - 1, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[2], user: User.all.order("id ASC")[0], description: Faker::TvShows::RuPaul.quote)

# Booking demo (today)
b_3 = Booking.create!(
  title: "Arrived in London!",
  date:Faker::Time.between_dates(from: DateTime.now , to: DateTime.now, period: :evening).beginning_of_hour,
  restaurant: Restaurant.all.order("id ASC")[0],
  user: User.all.order("id ASC")[2],
  description: "Hey guys! Recently arrived in London, look forward to meeting other fun people while enjoying what seems to be an amazing place for dinner!"
  )

# Other bookings today

 b_4 = Booking.create!(title:"Movie lovers", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[3], user: User.all.order("id ASC")[4], description: Faker::TvShows::RuPaul.quote)

b_5 = Booking.create!(title:"Expats club", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[4], user: User.all.order("id ASC")[5], description: Faker::TvShows::RuPaul.quote)

b_6 = Booking.create!(title:"Tall Trees Society", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[5], user: User.all.order("id ASC")[6], description: Faker::TvShows::RuPaul.quote)

b_7 = Booking.create!(title:"Bookworms of the east", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[6], user: User.all.order("id ASC")[7], description: Faker::TvShows::RuPaul.quote)

b_8 = Booking.create!(title:"Cat lovers", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[7], user: User.all.order("id ASC")[6], description: Faker::TvShows::RuPaul.quote)

b_9 = Booking.create!(title:"Cheese Aficionados", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[8], user: User.all.order("id ASC")[8], description: Faker::TvShows::RuPaul.quote)

b_10 = Booking.create!(title:"Runners", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[9], user: User.all.order("id ASC")[9], description: Faker::TvShows::RuPaul.quote)

b_11 = Booking.create!(title:"Globe trotters", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[10], user: User.all.order("id ASC")[21], description: Faker::TvShows::RuPaul.quote)

b_12 = Booking.create!(title:"Russians in London", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[11], user: User.all.order("id ASC")[22], description: Faker::TvShows::RuPaul.quote)

b_13 = Booking.create!(title:"Foodies", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[12], user: User.all.order("id ASC")[23], description: Faker::TvShows::RuPaul.quote)

b_14 = Booking.create!(title:"Made a Moko", date:Faker::Time.between_dates(from: DateTime.now, to: DateTime.now, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[13], user: User.all.order("id ASC")[24], description: Faker::TvShows::RuPaul.quote)



# Other bookings tomorrow

b_15 = Booking.create!(title:"Peterborough Poker Sharks", date:Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[14], user: User.all.order("id ASC")[2], description: Faker::TvShows::RuPaul.quote)

b_16 = Booking.create!(title:"Hoxton Marathon Runners", date:Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[15], user: User.all.order("id ASC")[3], description: Faker::TvShows::RuPaul.quote)

b_17 = Booking.create!(title:"Richmond Expats", date:Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[16], user: User.all.order("id ASC")[4], description: Faker::TvShows::RuPaul.quote)

b_18 = Booking.create!(title:"London Bowlers", date:Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[17], user: User.all.order("id ASC")[5], description: Faker::TvShows::RuPaul.quote)

b_19 = Booking.create!(title:"Motor Bikers", date:Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[18], user: User.all.order("id ASC")[6], description: Faker::TvShows::RuPaul.quote)

b_20 = Booking.create!(title:"Stay at home Dads", date:Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, period: :evening).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[19], user: User.all.order("id ASC")[7], description: Faker::TvShows::RuPaul.quote)

b_21 = Booking.create!(title:"Scotish Teachers", date:Faker::Time.between_dates(from: DateTime.now + 1, to: DateTime.now + 1, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[20], user: User.all.order("id ASC")[8], description: Faker::TvShows::RuPaul.quote)

# Other bookings day after tomorrow

b_22 = Booking.create!(title:"Tube Travelers", date:Faker::Time.between_dates(from: DateTime.now + 2, to: DateTime.now + 2, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[21], user: User.all.order("id ASC")[2], description: Faker::TvShows::RuPaul.quote)

b_23 = Booking.create!(title:"Star Wars Fans", date:Faker::Time.between_dates(from: DateTime.now + 2, to: DateTime.now + 2, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[22], user: User.all.order("id ASC")[3], description: Faker::TvShows::RuPaul.quote)

b_24 = Booking.create!(title:"Fin Tech Friends", date:Faker::Time.between_dates(from: DateTime.now + 2, to: DateTime.now + 2, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[23], user: User.all.order("id ASC")[4], description: Faker::TvShows::RuPaul.quote)

b_25 = Booking.create!(title: "London Ledgends", date: Faker::Time.between_dates(from: DateTime.now + 2, to: Date.today + 2, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[24], user: User.all.order("id ASC")[5], description: Faker::TvShows::RuPaul.quote)

b_26 = Booking.create!(title: "Dog Walkers", date: Faker::Time.between_dates(from: DateTime.now + 2, to: Date.today + 2, period: :afternoon).beginning_of_hour, restaurant: Restaurant.all.order("id ASC")[25], user: User.all.order("id ASC")[6], description: Faker::TvShows::RuPaul.quote)



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


# Groups today and past

Group.create!(booking: b_1, user: User.all.order("id ASC")[9])
Group.create!(booking: b_1, user: User.all.order("id ASC")[10])
Group.create!(booking: b_1, user: User.all.order("id ASC")[27])

Group.create!(booking: b_2, user: User.all.order("id ASC")[24])
Group.create!(booking: b_2, user: User.all.order("id ASC")[25])
Group.create!(booking: b_2, user: User.all.order("id ASC")[26])

# demo booking
Group.create!(booking: b_3, user: User.all.order("id ASC")[3])

# bookings today

Group.create!(booking: b_4, user: User.all.order("id ASC")[15])

Group.create!(booking: b_5, user: User.all.order("id ASC")[16])

Group.create!(booking: b_6, user: User.all.order("id ASC")[17])
Group.create!(booking: b_6, user: User.all.order("id ASC")[18])

Group.create!(booking: b_6, user: User.all.order("id ASC")[19])
Group.create!(booking: b_7, user: User.all.order("id ASC")[20])

Group.create!(booking: b_8, user: User.all.order("id ASC")[21])
Group.create!(booking: b_8, user: User.all.order("id ASC")[22])

Group.create!(booking: b_9, user: User.all.order("id ASC")[23])
Group.create!(booking: b_9, user: User.all.order("id ASC")[24])

Group.create!(booking: b_10, user: User.all.order("id ASC")[25])
Group.create!(booking: b_10, user: User.all.order("id ASC")[26])

Group.create!(booking: b_11, user: User.all.order("id ASC")[27])

Group.create!(booking: b_12, user: User.all.order("id ASC")[28])

Group.create!(booking: b_13, user: User.all.order("id ASC")[14])

Group.create!(booking: b_14, user: User.all.order("id ASC")[15])


# Groups tomorrow and future

Group.create!(booking: b_15, user: User.all.order("id ASC")[26])
Group.create!(booking: b_15, user: User.all.order("id ASC")[27])

Group.create!(booking: b_16, user: User.all.order("id ASC")[24])
Group.create!(booking: b_16, user: User.all.order("id ASC")[25])

Group.create!(booking: b_17, user: User.all.order("id ASC")[17])
Group.create!(booking: b_17, user: User.all.order("id ASC")[18])

Group.create!(booking: b_20, user: User.all.order("id ASC")[14])

Group.create!(booking: b_21, user: User.all.order("id ASC")[15])
Group.create!(booking: b_21, user: User.all.order("id ASC")[16])

Group.create!(booking: b_23, user: User.all.order("id ASC")[20])
Group.create!(booking: b_23, user: User.all.order("id ASC")[21])

Group.create!(booking: b_24, user: User.all.order("id ASC")[22])
Group.create!(booking: b_24, user: User.all.order("id ASC")[23])

Group.create!(booking: b_25, user: User.all.order("id ASC")[24])

Group.create!(booking: b_26, user: User.all.order("id ASC")[25])








