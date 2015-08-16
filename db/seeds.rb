# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  User.create(
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               username: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password_hash: 'test',
               role: 1,
               grade: Faker::Lorem.word,
               school: Faker::Lorem.word
              )
end
5.times do
  User.create(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               username: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password_hash: 'test',
               role: 0,
               grade: Faker::Lorem.word,
               school: Faker::Lorem.word
              )
end
5.times do
  Subject.create(name: Faker::Lorem.word)
  User.find(rand(1..5)).groups.create(
    name: Faker::Lorem.word,
    description: Faker::Lorem.sentence(rand(3..5))
  )
end

5.times do
  time_start = Faker::Time.between(4.days.ago, Time.now, :evening)
  time_end = time_start + 1800000

  Group.find(rand(1..5)).events.create(name: Faker::Lorem.word,
                attendees: rand(5..10),
                time_start: time_start,
                time_end: time_end,
                description: Faker::Lorem.sentence(rand(3..5)))
end

Event.all.each do |event|
  Location.create(
    street: Faker::Address.street_address,
    suite: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.cell_phone,
    contact: Faker::Internet.email
   ).events << event

   Subject.all.sample.events << event
   User.first(5).sample.events << event

   event.comments << Comment.create(description: Faker::Lorem.sentence(rand(1..3)))
end

5.times do
  x = Need.create(
    description: Faker::Lorem.sentence(3),
    subject_id: Subject.all.sample.id
  )
  Location.find(rand(1..5)).needs << x
  User.find(rand(1..5)).needs << x
end
