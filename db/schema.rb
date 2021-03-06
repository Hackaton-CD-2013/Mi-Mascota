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

ActiveRecord::Schema.define(version: 20131030223747) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "race"
    t.date     "birth"
    t.string   "weight"
    t.text     "habits"
    t.integer  "user_id"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id"

  create_table "posts", force: true do |t|
    t.text     "description"
    t.string   "kind"
    t.integer  "pet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "address"
    t.string   "photo"
    t.integer  "user_id"
  end

  add_index "posts", ["pet_id"], name: "index_posts_on_pet_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "location"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
