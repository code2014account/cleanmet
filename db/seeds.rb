# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
 password = Faker::Internet.password(8)
 user = User.new(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password
 )
 user.save!
end

25.times do
  registered_application = RegisteredApplication.create(
    name: Faker::App.name,
    url: Faker::Internet.url
    )
end

puts "#{RegisteredApplication.count} registered applications created"

event_ideas = ["sign in", "sign out", "create account", "update", "delete", "click article", "add to shopping cart"]

# Create Events
500.times do
    event = Event.create(
      name: event_ideas.sample,
      created_at: Faker::Time.between(7.days.ago, Date.today),
      registered_application: RegisteredApplication.all.sample
    )
end
