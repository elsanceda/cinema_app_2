# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(full_name:  "Admin User",
             email: "admin@example.com",
             mobile_number: "123-123-123",
             password:              "Password1",
             password_confirmation: "Password1",
             admin: true)

# Users
3.times do
    full_name = Faker::Name.name
    mobile_number = Faker::PhoneNumber.cell_phone
    email = Faker::Internet.email(name: full_name, separators: %w(. _ - +))
    password = "Password1"
    User.create!(full_name: full_name, 
                 mobile_number: mobile_number,
                 email: email,
                 password: password,
                 password_confirmation: password)
end

# Cinemas
3.times do |n|
    name = "#{Faker::Company.name} Theater"
    location = "#{Faker::Address.street_name}, #{Faker::Address.city} City"
    Cinema.create!(name: name, location: location, seats: 10-n)
end

# Movies
3.times do
    title = Faker::Movie.title
    synopsis = Faker::Lorem.paragraph(sentence_count: 5)
    Movie.create!(title: title, synopsis: synopsis)
end

# Showings
3.times do |n|
    timeslot = 1000
    cinema_id = n+1
    movie_id = n+1
    Showing.create!(timeslot: timeslot, 
                    cinema_id: cinema_id, 
                    movie_id: movie_id)
end

# Bookings
2.times do |n|
    showing_id = n+1
    2.times do |i|
        user_id = i+1
        seat_number = i+1
        Booking.create!(seat_number: seat_number, 
                        user_id: user_id, 
                        showing_id: showing_id)
    end
end
