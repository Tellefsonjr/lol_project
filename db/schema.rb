# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160812185442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "champion_masteries", force: :cascade do |t|
    t.integer  "summoner_id"
    t.integer  "championPointsSinceLastLevel"
    t.integer  "championPointsUntilNextLevel"
    t.integer  "championLevel"
    t.integer  "lastPlayTime"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "current_points"
    t.integer  "tokensEarned"
    t.string   "chestGranted"
    t.integer  "champion_id"
    t.index ["champion_id"], name: "index_champion_masteries_on_champion_id", using: :btree
    t.index ["summoner_id"], name: "index_champion_masteries_on_summoner_id", using: :btree
  end

  create_table "champions", force: :cascade do |t|
    t.integer  "championId"
    t.string   "name"
    t.string   "title"
    t.string   "icon"
    t.string   "splash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "tag"
    t.text     "lore"
  end

  create_table "champs", force: :cascade do |t|
    t.integer  "champion_id"
    t.integer  "match_id"
    t.integer  "champion_mastery_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["champion_id"], name: "index_champs_on_champion_id", using: :btree
    t.index ["champion_mastery_id"], name: "index_champs_on_champion_mastery_id", using: :btree
    t.index ["match_id"], name: "index_champs_on_match_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "summoner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["summoner_id"], name: "index_favorites_on_summoner_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "matches", force: :cascade do |t|
    t.bigint   "matchId"
    t.bigint   "summonerId"
    t.bigint   "kills"
    t.bigint   "deaths"
    t.bigint   "assists"
    t.bigint   "goldEarned"
    t.bigint   "summonerSpell1"
    t.bigint   "summonerSpell2"
    t.bigint   "item1"
    t.bigint   "item2"
    t.bigint   "item3"
    t.bigint   "item4"
    t.bigint   "item5"
    t.bigint   "item6"
    t.bigint   "mastery"
    t.bigint   "cs"
    t.bigint   "jungleCs"
    t.bigint   "totalDamage"
    t.bigint   "totalHeal"
    t.bigint   "totalCcDealt"
    t.bigint   "magicDamage"
    t.bigint   "physicalDamage"
    t.bigint   "damageTaken"
    t.bigint   "wardsPlaced"
    t.bigint   "doubleKills"
    t.bigint   "tripleKills"
    t.bigint   "quadraKills"
    t.bigint   "pentaKills"
    t.string   "win"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.bigint   "championLevel"
    t.integer  "summoner_id"
    t.bigint   "timestamp"
    t.integer  "masteryPoints"
    t.integer  "mdScore"
    t.integer  "champion_id"
    t.index ["champion_id"], name: "index_matches_on_champion_id", using: :btree
    t.index ["summoner_id"], name: "index_matches_on_summoner_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_relationships_on_follower_id", using: :btree
  end

  create_table "summoners", force: :cascade do |t|
    t.string   "name"
    t.integer  "summonerId"
    t.string   "region"
    t.string   "icon"
    t.integer  "summonerLevel"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "profileIconId"
    t.bigint   "revisionDate"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "summoner_id"
    t.text     "bio"
    t.string   "avatar"
    t.index ["summoner_id"], name: "index_users_on_summoner_id", using: :btree
  end

  add_foreign_key "champion_masteries", "summoners"
  add_foreign_key "champs", "champion_masteries"
  add_foreign_key "champs", "champions"
  add_foreign_key "champs", "matches"
  add_foreign_key "favorites", "summoners"
  add_foreign_key "favorites", "users"
  add_foreign_key "matches", "summoners"
  add_foreign_key "posts", "users"
end
