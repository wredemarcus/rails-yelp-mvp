# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

category = %w[Chinese Italian Japanese French Belgian]

20.times do
  restaurant = Restaurant.new
  restaurant.name = Faker::Restaurant.name
  restaurant.address = Faker::Address.city
  restaurant.phone_number = Faker::PhoneNumber.cell_phone_in_e164
  restaurant.category = category.sample
  restaurant.save
  rand(3..10).times do
    review = Review.new
    review.restaurant = restaurant
    review.content = Faker::Restaurant.review
    review.rating = rand(0..5)
    review.save!
  end
end
