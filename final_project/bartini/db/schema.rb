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

ActiveRecord::Schema.define(version: 20141130202821) do

  create_table "data_storages", force: true do |t|
    t.string   "path"
    t.string   "original_filename"
    t.integer  "user_account_id"
    t.integer  "drink_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drink_associations", force: true do |t|
    t.integer  "drink_id"
    t.integer  "ingredient_id"
    t.integer  "step_id",       default: 0
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drinks", force: true do |t|
    t.string  "drink_name"
    t.integer "user_account_id"
    t.integer "recipe_id"
    t.text    "description"
    t.boolean "visibility"
  end

  create_table "ingredients", force: true do |t|
    t.string  "ingredient_name"
    t.integer "weight_type_id"
  end

  create_table "reviews", force: true do |t|
    t.integer "drink_id"
    t.integer "user_account_id"
    t.string  "comment"
    t.integer "rating"
  end

  create_table "service_statuses", force: true do |t|
    t.string "status"
    t.string "tier"
  end

  create_table "steps", force: true do |t|
    t.string "step_description"
  end

  create_table "user_accounts", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "user_name"
    t.string "password_hash"
    t.string "password_salt"
  end

  create_table "user_drink_libraries", force: true do |t|
    t.integer "user_account_id"
    t.integer "drink_id"
  end

  create_table "venue_accounts", force: true do |t|
    t.string  "venue_name"
    t.integer "servie_status_id"
    t.integer "user_account_id"
  end

  create_table "venue_drink_libraries", force: true do |t|
    t.integer "bar_id"
    t.integer "drink_id"
  end

  create_table "venue_locations", force: true do |t|
    t.integer "bar_id"
    t.integer "address_number"
    t.string  "address_street"
    t.string  "city"
    t.string  "state_code"
    t.string  "country_code"
    t.integer "zip"
  end

  create_table "weight_types", force: true do |t|
    t.string "type_of_weight"
    t.string "measure_type"
  end

end
