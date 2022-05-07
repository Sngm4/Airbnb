# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reservation.destroy_all
Listing.destroy_all
City.destroy_all
User.destroy_all

10.times do
  city = City.create(name: Faker::Address.city, zip_code: Faker::Number.within(range: 10000..74999))
end

20.times do
  user = User.create(email: Faker::Internet.safe_email, phone_number: "+33#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}#{rand(0..9)}", description: Faker::Lorem.characters(number: 180))
end

50.times do
  listing = Listing.create(available_beds: Faker::Number.between(from: 1, to: 10),price: Faker::Number.between(from: 30, to: 100), description: Faker::Lorem.characters(number: 180), has_wifi: Faker::Boolean.boolean, welcome_message: Faker::Lorem.sentence, city: City.all.sample, admin: User.all.sample)
end

Listing.all.each do |list|
  5.times do
    duration1 = rand(1..14)
    begin1 = Faker::Date.forward(days: rand(0..100))
    endate = begin1 + duration1
    futur_reservation = Reservation.create(start_date: begin1, end_date: endate, guest: User.all.sample, listing: list)
  end
  5.times do
    duration2 = rand(1..14)
    ending2 = Faker::Date.backward(days: rand(0..100))
    begin2 = ending2 - duration2
    past_reservation = Reservation.create(start_date: begin2, end_date: ending2, guest: User.all.sample, listing: list)
  end
end