# Create users
users = 50.times.map { User.create!(username: Faker::Internet.unique.username) }

# Create posts
posts = 50_000.times.map do
  Post.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    body: Faker::Lorem.paragraph(sentence_count: 2),
    user: users.sample
  )
end

# Create reviews
20_000.times do
  Review.create!(
    post: posts.sample,
    user: users.sample,
    rate: rand(1..5),
    comment: Faker::Lorem.sentence(word_count: 5)
  )
end