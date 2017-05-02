# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'random_data'

3.times do
  User.create!(
    email: RandomData.random_email,
    password: RandomData.random_sentence
  )
end

users = User.all

5.times do
  Wiki.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    user: users.sample
  )
end

wikis = Wiki.all


admin = User.create!(
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

standard = User.create!(
  email: 'member@example.com',
  password: 'helloworld'
)



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
