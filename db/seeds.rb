# users dummy data
60.times do |user|
  name = Faker::Name.first_name
  email = Faker::Internet.safe_email(name: name)
  password = "testtest"
  date = Faker::Date.backward(days: 200)
  User.create!(name: name, 
              email: email, 
              password: password,
              password_confirmation: password,
              created_at: date,
              avatar: nil)
end

# # feed dummy data
# 60.times do |feed|
#   content = Faker::Lorem.paragraph(sentence_count: 2)
#   # image = Faker::LoremFlickr.image(size: "600x600")
#   date = Faker::Date.backward(days: 400)
#   Feed.create!(content: content, 
#               image: "https://picsum.photos/600/480", 
#               created_at: date,
#               user_id: rand(1..60))
# end

# # comments dummy data
# 200.times do |comment|
#   content = Faker::Lorem.paragraph(sentence_count: 3)
#   date = Faker::Date.backward(days: 200)
#   Comment.create!(content: content,
#                   created_at: date,
#                   feed_id: rand(1..60),
#                   user_id: rand(1..60))
# end

# # favorites dummy data
# 120.times do |favorite|
#   date = date = Faker::Date.backward(days: 100)
#   Favorite.create!(feed_id: rand(1..60),
#                   user_id: rand(1..60))
# end

