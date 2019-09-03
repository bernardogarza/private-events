# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  @user = User.create([{ user_name: Faker::Name.name, email: Faker::Internet.email }])
end

users = User.all
3.times do
  users.each do |user|
    user.events.create!([{ title: Faker::Lorem.word,
                           description: Faker::ChuckNorris.fact,
                           date: Faker::Date.between_except(from: 3.year.ago, to: 1.year.from_now, excepted: Date.today),
                           location: Faker::Address.street_address }])
  end
end
