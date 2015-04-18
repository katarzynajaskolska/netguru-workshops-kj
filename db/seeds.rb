# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(
  admin: true,
  firstname: Faker::Name.first_name,
  lastname: Faker::Name.last_name,
  email: 'admin@example.com',
  password: 'password')

5.times do |n|
  User.create(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: "user#{n+1}@example.com",
    password: 'password')
end

Category.create(name: 'phones')

10.times do |n|
  Product.create(
    title: Faker::Product.model,
    description: Faker::Lorem.sentence,
    price: rand(1000),
    category_id: 1,
    user_id: rand(1..6))
end

30.times do |n|
  Review.create(
    content: Faker::Lorem.sentence,
    rating: rand(1..5),
    product_id: rand(1..10),
    user_id: rand(1..6))
end
