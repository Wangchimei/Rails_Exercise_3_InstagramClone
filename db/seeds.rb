# users dummy data
60.times do |user|
  name = Faker::Name.unique.name
  email = Faker::Internet.safe_email(name: name)
  password = "testtest"
  avatar = Faker::LoremFlickr.image(size: "400x400", search_terms: ['animal']) 
  date = Faker::Date.backward(days: 400)
  User.create!(name: name, 
              email: email, 
              password: password, 
              created_at: date,
              avatar: avatar)
end

# feed dummy data
60.times do |feed|
  image = Faker::LoremFlickr.image(size: "600x600")
  content = Faker::Lorem.paragraph(sentence_count: 2)
  date = Faker::Date.backward(days: 400)
  Feed.create!(name: name, 
              email: email, 
              password: password, 
              created_at: date,
              user_id: rand(1..60))
end

# comments dummy data
200.times do |comment|
  content = Faker::Lorem.paragraph(sentence_count: 3)
  date = Faker::Date.backward(days: 200)
  Comment.create!(content: content,
                  created_at: date,
                  feed_id: rand(1..60),
                  user_id: rand(1..60))
end

# favorites dummy data
120.times do |favorite|
  date = date = Faker::Date.backward(days: 100)
  Favorite.create!(feed_id: rand(1..60),
                  user_id: rand(1..60))
end

