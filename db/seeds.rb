# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
