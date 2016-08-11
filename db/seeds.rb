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
clark.follow(timmey)
clark.follow(jerico)
jerico.follow(timmey)
jerico.follow(clark)
