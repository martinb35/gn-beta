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

ActiveRecord::Schema.define(version: 20140217040826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bathrooms", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floors", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_categories", force: true do |t|
    t.string   "title"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.integer  "level"
    t.integer  "floor"
    t.integer  "room"
    t.integer  "bathroom"
    t.boolean  "material"
    t.text     "notes"
    t.string   "address"
    t.string   "location_ref"
    t.string   "second_address"
    t.integer  "stored_address"
    t.string   "latlong"
    t.datetime "when"
    t.decimal  "offer",           precision: 8, scale: 2
    t.boolean  "private"
    t.boolean  "auto_assign"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_category"
    t.integer  "floor_id"
    t.integer  "job_category_id"
    t.string   "contact"
    t.integer  "status"
  end

  create_table "levels", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notification_categories", force: true do |t|
    t.string   "notification"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prefer"
  end

  create_table "preferences", force: true do |t|
    t.integer  "user_id"
    t.integer  "notification_category_id"
    t.boolean  "check"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "preferences", ["notification_category_id"], name: "index_preferences_on_notification_category_id", using: :btree
  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "role_id"
    t.string   "lastname"
    t.string   "calle"
    t.string   "cp"
    t.string   "colonia"
    t.string   "ciudad"
    t.string   "phone"
    t.string   "birthdate"
    t.string   "gender"
    t.string   "prefer"
  end

end
