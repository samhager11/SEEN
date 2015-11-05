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

ActiveRecord::Schema.define(version: 20151104213112) do

  create_table "address_names", force: :cascade do |t|
    t.integer  "degree"
    t.integer  "minute"
    t.string   "name_part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "city"
    t.string   "country"
    t.decimal  "latitude"
    t.integer  "latitude_deg"
    t.integer  "latitude_min"
    t.decimal  "latitude_sec"
    t.string   "latitude_name_part"
    t.decimal  "longitude"
    t.integer  "longitude_deg"
    t.integer  "longitude_min"
    t.decimal  "longitude_sec"
    t.string   "longitude_name_part"
    t.string   "address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "user_id"
    t.string   "phone_number"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "forums", force: :cascade do |t|
    t.string   "post"
    t.string   "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "url"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "image"
    t.string   "city"
  end

  add_index "photos", ["address_id"], name: "index_photos_on_address_id"
  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone_number",    limit: 10
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "user_name"
    t.string   "password_digest"
    t.integer  "address_id"
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"

end
