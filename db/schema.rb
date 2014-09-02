# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140902014053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: true do |t|
    t.integer "user_id"
    t.integer "pub_challenge_id"
  end

  create_table "followers", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "personal_challenges", force: true do |t|
    t.string  "name"
    t.string  "address"
    t.text    "image"
    t.text    "description"
    t.integer "user_id"
  end

  create_table "pub_challenges", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.string   "badge"
    t.string   "point_value"
    t.integer  "pub_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pubs", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.text     "description"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "image"
  end

  create_table "tasks", force: true do |t|
    t.string  "task"
    t.integer "pub_challenge_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.text     "avatar"
    t.string   "location"
    t.string   "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
    t.boolean  "is_pub",          default: false
    t.boolean  "is_pub_verified", default: false
  end

end
