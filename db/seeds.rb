# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "I'm destroying the db"
User.destroy_all
Basket.destroy_all
CharityProfile.destroy_all
DonationType.destroy_all
BasketItem.destroy_all
puts "db destroyed"

user1 = User.create(first_name: "Louise", last_name: "Stone", email: "test@test.com", address: "Borough, London", charity: false, phone_number: "07111111111", password: 123456 )
puts "I am creating a new user"
user2 = User.create(first_name: "Kat", last_name: "Brown", email: "test1@test.com", address: "Battersea, London", charity: true, phone_number: "07111111112", password: 123456 )
puts "I am creating a new user"
user3 = User.create(first_name: "George", last_name: "Hill", email: "test2@test.com", address: "Putney, London", charity: true, phone_number: "07111111113", password: 123456)
puts "I am creating a new user"
user4 = User.create(first_name: "Will", last_name: "Taylor", email: "test3@test.com", address: "West Kensington, London", charity: false, phone_number: "07111111114", password: 123456)
puts "I am creating a new user"
user5 = User.create(first_name: "Ziggy", last_name: "Bartkevicius", email: "test4@test.com", address: "Pitcairn Island, Pitcairn Islands", charity: false, phone_number: "07111111115", password: 123456)
puts "I am creating a new user"

charityprofile1 = CharityProfile.create(user_id: user2.id)
puts "I am creating a charity profile user"
charityprofile2 = CharityProfile.create(user_id: user3.id)
puts "I am creating a charity profile user"

donationtype1 = DonationType.create(name: "Bed for one night", price: 10.00, charity_profile_id: charityprofile1.id)
puts "I am creating a donation-type"
donationtype2 = DonationType.create(name: "Meal", price: 5.00, charity_profile_id: charityprofile1.id)
puts "I am creating a donation-type"
donationtype3 = DonationType.create(name: "Bed for a week", price: 70.00, charity_profile_id: charityprofile2.id)
puts "I am creating a donation-type"
donationtype4 = DonationType.create(name: "Food for a day", price: 12.50, charity_profile_id: charityprofile2.id)
puts "I am creating a donation-type"
