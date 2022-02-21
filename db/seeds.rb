# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  user = User.new(
    name: "user#{n + 1}",
    email: "example#{n + 1}@example.com",
    password: "password"
  )
  user.save!
end

User.all.each do |user|
  user.posts.create!(
    author: "著者",
    title: "書名",
    body: "書評の本文",
    star: 4,
  )
end
