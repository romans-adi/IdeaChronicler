# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all

users = []

30.times do |i|
  user = User.create(
    name: Faker::Name.name,
    photo: "https://unsplash.com/photos/abcdef",
    bio: Faker::Quote.most_interesting_man_in_the_world,
    posts_counter: 0
  )
  users << user # Push the newly created user into the array
end

users.each do |user|
  num_posts = rand(1..10)
  user.update(posts_counter: num_posts)

  num_posts.times do
    Post.create(
      author_id: user.id,
      title: Faker::Book.title,
      text: Faker::Quote.famous_last_words,
      comments_counter: 0,
      likes_counter: 0
    )
  end
end

User.all.each do |user|
  user.posts.each do |post|
    rand(0..5).times do
      post.comments.create(
        text: Faker::Lorem.sentence,
        author: User.all.sample
      )
    end

    post.update(likes_counter: rand(0..100))
  end
end
