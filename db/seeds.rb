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

user1 = User.create(first_name: "Katherine", last_name: "Brown", email: "donations@the-giving-loop.com", address: "Borough, London", charity: false, phone_number: "07111111111", password: 123456 )
puts "I am creating a new user"
user2 = User.create(first_name: "Kat", last_name: "Brown", email: "katherine.brown06@outlook.com", address: "Battersea, London", charity: true, phone_number: "07111111112", password: 123456 )
puts "I am creating a new user"
user3 = User.create(first_name: "George", last_name: "Hill", email: "gwhill96@gmail.com", address: "Putney, London", charity: true, phone_number: "07111111113", password: 123456)
puts "I am creating a new user"
user4 = User.create(first_name: "Will", last_name: "Taylor", email: "willtaylor147@gmail.com", address: "West Kensington, London", charity: false, phone_number: "07111111114", password: 123456)
puts "I am creating a new user"
user5 = User.create(first_name: "Ziggy", last_name: "Bartkevicius", email: "bartkevicius.dziugas@gmail.com", address: "Pitcairn Island, Pitcairn Islands", charity: false, phone_number: "07111111115", password: 123456)
puts "I am creating a new user"

charityprofile1 = CharityProfile.create(user_id: user2.id)
puts "I am creating a charity profile user"
charityprofile2 = CharityProfile.create(user_id: user3.id)
puts "I am creating a charity profile user"

donationtype1 = DonationType.create(name: "Bed for one night", price_cents: 1000, charity_profile_id: charityprofile1.id, bio: "Your donation will provide a safe place to sleep with a warm bed 🛏 for a night in one of our shelters 🏨. You'll receive an email once your donation has been redeemed.🧡 ", photo_url: "warm_bed_card.png")
puts "I am creating a donation-type"
donationtype2 = DonationType.create(name: "Meal", price_cents: 500, charity_profile_id: charityprofile1.id, bio: "Your donation will provide a hot meal 🍲 for one person. You will receive an email notification once your donation has been redeemed.🧡", photo_url: "hot_meal_card.png")
puts "I am creating a donation-type"
donationtype3 = DonationType.create(name: "Bed for a week", price_cents: 7000, charity_profile_id: charityprofile2.id, bio: "Your donation will provide a safe place to sleep with a warm bed 🛏 for a week in one of our shelters 🏨. You'll receive an email once your donation has been redeemed.🧡", photo_url: "warm-bed-for-week.png")
puts "I am creating a donation-type"
donationtype4 = DonationType.create(name: "Food for a day", price_cents: 1250, charity_profile_id: charityprofile2.id, bio: "Your donation will provide three nutritional meals 🍲🍎 for one person. You will receive an email notification once your donation has been redeemed.🧡", photo_url: "food-one-week.png")
puts "I am creating a donation-type"
donationtype5 = DonationType.create(name: "Skills session", price_cents: 3000, charity_profile_id: charityprofile2.id, bio: "Your donation will provide a valuable skills training session for one person 👨‍💻. You will receive an email notification once your donation has been redeemed.🧡", photo_url: "skills_session_card.png")
puts "I am creating a donation-type"
