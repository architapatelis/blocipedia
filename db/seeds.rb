# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(6)
  )
end

users = User.all

10.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
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
