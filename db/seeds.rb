# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "open-uri"

type_of_musician = ["Vocal", "Drums", "Guitar", "Piano", "Violine" ]
location = ["Berlin", "Hanover", "Hamburg", "Cologne", "Stuttgart"]
description = [
  "I am a classically trained pianist who attended the Juilliard School, where I honed my technical skills and developed a deep appreciation for the art of interpretation.",
"As a graduate of the Curtis Institute of Music, I am a classically trained cellist who believes in the power of music to connect people and to heal the soul.",
"I am a classically trained violinist who attended the New England Conservatory of Music, where I learned to channel my emotions through my music and to create unforgettable performances.",
"As a graduate of the Royal Academy of Music, I am a classically trained flutist who is passionate about exploring the full range of colors and emotions in the flute repertoire.",
"I am a classically trained guitarist who attended the Peabody Institute of the Johns Hopkins University, where I studied with some of the most renowned guitarists in the world and developed my own unique approach to the instrument.",
"As a graduate of the Hochschule für Musik und Theater München, I am a classically trained pianist who is dedicated to exploring the full range of emotions and nuances in the piano repertoire.",
"I am a classically trained cellist who attended the Shepherd School of Music at Rice University, where I learned to combine technical precision with emotional depth in my performances.",
"As a graduate of the Royal College of Music, I am a classically trained oboist who is committed to using my music to connect with people and to inspire positive change in the world.",
"I am a classically trained violist who attended the Yale School of Music, where I developed a deep appreciation for the richness and complexity of the viola repertoire.",
"As a graduate of the École Normale de Musique de Paris, I am a classically trained pianist who believes in the power of music to inspire and uplift people from all walks of life.",
"I am a classically trained clarinetist who attended the Eastman School of Music, where I learned to combine technical virtuosity with emotional sensitivity in my playing.",
"As a graduate of the Manhattan School of Music, I am a classically trained bassoonist who is passionate about exploring the full range of colors and textures in the bassoon repertoire.",
"I am a classically trained harpist who attended the Jacobs School of Music at Indiana University, where I learned to channel my emotions through my playing and to create truly unforgettable performances.",
"As a graduate of the Sibelius Academy in Helsinki, I am a classically trained violinist who is dedicated to exploring the full range of emotions and colors in the violin repertoire.",
"I am a classically trained pianist who attended the Conservatoire de Paris, where I learned to communicate the deepest emotions of the music through my playing.",
"As a graduate of the Hochschule für Musik Hanns Eisler Berlin, I am a classically trained double bassist who is committed to using my music to create connections between people and to inspire positive change in the world.",
"I am a classically trained trumpeter who attended the Conservatorium van Amsterdam, where I learned to combine technical precision with emotional expression in my playing.",
"As a graduate of the Royal Northern College of Music, I am a classically trained percussionist who is passionate about exploring the full range of colors and textures in the percussion repertoire.",
]

puts "Deleting current Database entries...!"

Review.destroy_all
Message.destroy_all
Booking.destroy_all
Package.destroy_all
Musician.destroy_all
User.destroy_all

puts "Creating users"
colleen = User.create!(first_name: "Colleen", last_name: "Brown", email: "colleen@colleen.com", password: "123456")
file_colleen = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673201251/tdk5i2gd1etzmwduejsy.jpg")
colleen.photo.attach(io: file_colleen, filename: "colleen.png", content_type: "image/png")
katja = User.create!(first_name: "Katja", last_name: "Löffler", email: "katja@katja.com", password: "123456")
file_katja = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1673201177/uaqwpyl6xjs1hm2jfaq6.jpg")
katja.photo.attach(io: file_katja, filename: "katja.png", content_type: "image/png")
louise = User.create!(first_name: "Louise", last_name: "Wedel", email: "louise@louise.com", password: "123456")
file_louise = URI.open("https://avatars.githubusercontent.com/u/116000558?v=4")
louise.photo.attach(io: file_louise, filename: "louise.png", content_type: "image/png")
besher = User.create!(first_name: "Besher", last_name: "Albalkhi", email: "besher@besher.com", password: "123456")
file_besher = URI.open("https://avatars.githubusercontent.com/u/122227511?v=4")
besher.photo.attach(io: file_besher, filename: "besher.png", content_type: "image/png")
puts "created users"

puts "Creating Musicians"

  cello_female_1 = Musician.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Cello",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen

  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912646/joel-vogt-XAdPSpLhHpg-unsplash_qjpxke.jpg")
  cello_female_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: cello_female_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: cello_female_1.id
  )


piano_male_2 = Musician.create!(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Piano",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912159/soundtrap-BU816BGrP0U-unsplash_wia3rv.jpg")
piano_male_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id: piano_male_2.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id: piano_male_2.id
)


  cello_male_1 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Cello",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912645/jeana-bala-atD181puoXM-unsplash_f5hflb.jpg")
  cello_male_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have to breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: cello_male_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: cello_male_1.id
  )

  guitar_male_1 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Guitar",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912157/thiago-borrere-alvim-bf8APnBxoCk-unsplash_fg2vtk.jpg")
  guitar_male_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: guitar_male_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: guitar_male_1.id
  )


  vocal_female_1 = Musician.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Vocal",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912150/anish-prajapati-5Sxh_zg5Des-unsplash_njzpww.jpg")
  vocal_female_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: vocal_female_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: vocal_female_1.id
  )

  cello_male_2 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Cello",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912154/kael-bloom-0Fko0cLI2VQ-unsplash_uj1ll3.jpg")
  cello_male_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id: cello_male_2.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id: cello_male_2.id
  )

  guitar_male_2 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Guitar",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912157/leonardo-zorzi-vVtkT4ny8hM-unsplash_d3jida.jpg")
  guitar_male_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id:  guitar_male_2.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id:  guitar_male_2.id
  )


  cello_female_2 = Musician.create!(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Cello",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912158/sam-moghadam-khamseh-VMFLpCrDpFM-unsplash_ixeddf.jpg")
  cello_female_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id:  cello_female_2.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id:  cello_female_2.id
  )

  violin_female_1 = Musician.create!(
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    nickname: Faker::Music.band,
    location: location.sample,
    description: description.sample,
    type_of_musician: "Violin",
    youtube_link: "https://www.youtube.com/@LeWagon/about",
    spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
    soundcloud_link: "https://soundcloud.com/RIHANNA",
    instagram_link: "https://www.instagram.com/womenintech/?hl=de",
    user: colleen
  )
  file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912155/luwadlin-bosman-pD1KUHCZ9Yc-unsplash_dkp1ua.jpg")
  violin_female_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

  Package.create!(
    title: "Package Large",
    description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 350,
    hours: 4,
    musician_id:  violin_female_1.id
  )

  Package.create!(
    title: "Package Small",
    description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
    price: 200,
    hours: 2,
    musician_id:  violin_female_1.id
  )


guitar_female_1 = Musician.create!(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Guitar",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912154/jakayla-toney-_SUo0bFBMRc-unsplash_urmkp6.jpg")
guitar_female_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id:  guitar_female_1.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id:  guitar_female_1.id
)


vocal_female_2 = Musician.create!(
  first_name: Faker::Name.female_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Vocal",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912150/ben-collins-uPmfKSOT5f8-unsplash_b5coj3.jpg")
vocal_female_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id:  vocal_female_2.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id:  vocal_female_2.id
)


piano_male_1 = Musician.create!(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Piano",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912155/platforma-za-drustveni-centar-cakovec-JKSXxal-UAI-unsplash_t478ru.jpg")
piano_male_1.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')

Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id:  piano_male_1.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id:  piano_male_1.id
)


violin_female_2 = Musician.create!(
  first_name: Faker::Name.male_first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Music.band,
  location: location.sample,
  description: description.sample,
  type_of_musician: "Violin",
  youtube_link: "https://www.youtube.com/@LeWagon/about",
  spotify_link: "https://open.spotify.com/show/3BnStSrxm2bsGwNrWAS8P9",
  soundcloud_link: "https://soundcloud.com/RIHANNA",
  instagram_link: "https://www.instagram.com/womenintech/?hl=de",
  user: colleen
)
file = URI.open("https://res.cloudinary.com/dpki23ark/image/upload/c_fill,h_1000,w_1000/v1678912153/lena-grimalkin-Wx6zfKBUJXg-unsplash_putcqn.jpg")
violin_female_2.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')


Package.create!(
  title: "Package Large",
  description: "I will play 4 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 350,
  hours: 4,
  musician_id:  violin_female_2.id
)

Package.create!(
  title: "Package Small",
  description: "I will play 2 hours at your event. I would have two breaks with 10 minutes, besides that you will listen to the best live music!",
  price: 200,
  hours: 2,
  musician_id:  violin_female_2.id
)


# 10.times do
#   musicians_katja = Musician.create!(
#     first_name: Faker::Name.male_first_name,
#     last_name: Faker::Name.last_name,
#     nickname: Faker::Music.band,
#     location: location.sample,
#     description: description.sample,
#     type_of_musician: type_of_musician.sample,
#     youtube_link: Faker::Internet.url,
#     spotify_link: Faker::Internet.url,
#     user: katja
#   )

#   file = URI.open("https://xsgames.co/randomusers/avatar.php?g=male")
#   musicians_katja.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
# end

# 10.times do
#   musicians_louise = Musician.create!(
#     first_name: Faker::Name.female_first_name,
#     last_name: Faker::Name.last_name,
#     nickname: Faker::Music.band,
#     location: location.sample,
#     description: description.sample,
#     type_of_musician: type_of_musician.sample,
#     youtube_link: Faker::Internet.url,
#     spotify_link: Faker::Internet.url,
#     user: louise
#   )

#   file = URI.open("https://xsgames.co/randomusers/avatar.php?g=female")
#   musicians_louise.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
# end

# 10.times do
#   @musicians_besher = Musician.create!(
#     first_name: Faker::Name.male_first_name,
#     last_name: Faker::Name.last_name,
#     nickname: Faker::Music.band,
#     location: location.sample,
#     description: description.sample,
#     type_of_musician: type_of_musician.sample,
#     youtube_link: Faker::Internet.url,
#     spotify_link: Faker::Internet.url,
#     user: besher
#   )

#   file = URI.open("https://xsgames.co/randomusers/avatar.php?g=male")
#   @musicians_besher.photo.attach(io: file, filename: 'musician.png', content_type: 'image/png')
# end

puts "created #{Musician.count} musicians"

# puts "creating packages"

# Musician.all.each do |musician|
#   Package.create!(
#     description: "You will get 2 hours of live music. I can play every song you like!",
#     price: 200,
#     hours: 2,
#     musician_id: musician.id
#   )

#   Package.create!(
#     description: "I will play 4 hours at your event. I would have to breaks with 10 minutes, besides that you will listen to the best live music!",
#     price: 350,
#     hours: 4,
#     musician_id: musician.id
#   )
# end

# # @musicians_besher.each do |musician|
# #   Package.create!(
# #     description: "I will play 4 hours at your event. I would have to breaks with 10 minutes, besides that you will listen to the best live music!",
# #     price: 350,
# #     hours: 4,
# #     musician_id: musician.id
# #   )
# # end

# # Musician.all.each do |musician|
# #   Package.create!(
# #     description: "Package Large",
# #     price: rand(310..500),
# #     hours: rand(3..5),
# #     musician_id: musician.id
# #   )
# # end


# puts "created #{Package.count} packages"
