# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

puts "Deleting current Database entries...!"

type_of_event = ["wedding ceremony", "wedding party", "birthday party", "art event",  ]
type_of_musician = ["", "Piano player", "Violinist", "Vocal"]
location = ["Berlin", "Hamburg", "Cologne", "Stuttgart", "Hannover"]

Message.destroy_all
Booking.destroy_all
Package.destroy_all
Musician.destroy_all
User.destroy_all

puts "Creating users"
colleen = User.create!(first_name: "Colleen", last_name: "Brown", email: "colleen@colleen.com", password: "123456")
katja = User.create!(first_name: "Katja", last_name: "Löffler", email: "katja@katja.com", password: "123456")
file_katja = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673201177/uaqwpyl6xjs1hm2jfaq6.jpg")
louise = User.create!(first_name: "Louise", last_name: "Wedel", email: "louise@louise.com", password: "123456")
file_louise = URI.open("https://avatars.githubusercontent.com/u/116000558?v=4")
besher = User.create!(first_name: "Besher", last_name: "Albalkhi", email: "besher@besher.com", password: "123456")
file_besher = URI.open("https://avatars.githubusercontent.com/u/122227511?v=4")
besher.photo.attach(io: file_besher, filename: "besher.png", content_type: "image/png")
puts "created users"

puts "Creating Musicians"

10.times do
  musicians = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: Faker::Music.instrument,
    type_of_event: type_of_event.sample,
    type_of_musician: type_of_musician.sample,
    youtube_link: Faker::Internet.url,
    spotify_link: Faker::Internet.url,
    user: colleen
  )
  file = URI.open("https://xsgames.co/randomusers/avatar.php?g=female")
  musicians.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
end

10.times do
  musicians = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: Faker::Music.instrument,
    type_of_event: type_of_event.sample,
    type_of_musician: type_of_musician.sample,
    youtube_link: Faker::Internet.url,
    spotify_link: Faker::Internet.url,
    user: louise
  )
  file = URI.open("https://xsgames.co/randomusers/avatar.php?g=male")
  musicians.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
end

10.times do
  musicians = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: Faker::Music.instrument,
    type_of_event: type_of_event.sample,
    type_of_musician: type_of_musician.sample,
    youtube_link: Faker::Internet.url,
    spotify_link: Faker::Internet.url,
    user: besher
  )
  file = URI.open("https://xsgames.co/randomusers/avatar.php?g=male")
  musicians.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
end

10.times do
  musicians = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: Faker::Music.instrument,
    type_of_event: type_of_event.sample,
    type_of_musician: type_of_musician.sample,
    youtube_link: Faker::Internet.url,
    spotify_link: Faker::Internet.url,
    user: katja
  )

  file = URI.open("https://xsgames.co/randomusers/avatar.php?g=female")
  musicians.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
end

puts "created #{Musician.count} musicians"

puts "creating packages"

Musician.all.each do |musician|
  Package.create!(
    description: "Package Small",
    price: rand(200..300),
    hours: rand(1..2),
    musician_id: musician.id
  )
end

Musician.all.each do |musician|
  Package.create!(
    description: "Package Large",
    price: rand(310..500),
    hours: rand(3..5),
    musician_id: musician.id
  )
end



puts "created #{Package.count} packages"
