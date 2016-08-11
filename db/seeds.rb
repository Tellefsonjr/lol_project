# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

timmey = User.create!(name: "Timmey", email: "timmeyellefson@gmail.com",
  password: "teejteej123", password_confirmation: "teejteej123")
clark = User.create!(name: "Clark", email: "supermoneezzy@gmail.com",
  password: "clark123", password_confirmation: "clark123")
jerico = User.create!(name: "Jerico", email: "jericomanalo@gmail.com",
  password: "jerico123", password_confirmation: "jerico123")

timmey.follow(clark)
timmey.follow(jerico)
Post.create!(title: "Timmey's first post", content:"Aaaaaaye dooods", user_id: timmey.id)
clark.follow(timmey)
clark.follow(jerico)
Post.create!(title: "Clark's first post", content:"Sup fooools", user_id: clark.id)
jerico.follow(timmey)
jerico.follow(clark)
Post.create!(title: "Jerico's first post", content:"Suhh dooohs", user_id: jerico.id)
