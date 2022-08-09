# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a main sample user.
10.times do |n|
    User.create!(
      email: "user#{n}@example.org",
      password: "foobar#{n}"
    )
end

5.times do |p|
  users = User.order(:created_at).take(5)
  users.each do |u|
      title = Faker::Lorem.sentence(word_count: rand(1..5))
      body = (rand(1..5).times.collect { |n| Faker::Lorem.paragraph(sentence_count: rand(3..10)) }).map{ |e| e }.join('<br/>')
      u.posts.create!(title: title, body: body)
  end
end

#Rails.cache.clear
#ActiveRecord::Base.connection.query_cache.clear