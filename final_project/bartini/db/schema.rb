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

ActiveRecord::Schema.define(version: 20141125142837) do

  create_table "drink_ingredients", force: true do |t|
    t.integer "drink_id",      null: false
    t.integer "ingredient_id", null: false
    t.integer "quantity",      null: false
  end

  create_table "drinks", force: true do |t|
    t.string  "drink_name",      null: false
    t.integer "user_account_id", null: false
    t.integer "recipe_id",       null: false
    t.boolean "private",         null: false
  end

  create_table "ingredients", force: true do |t|
    t.string  "ingredient_name", null: false
    t.integer "weight_type_id",  null: false
  end

  create_table "recipes", force: true do |t|
    t.integer "drink_id",      null: false
    t.integer "step_id",       null: false
    t.integer "ingredient_id"
  end

  create_table "reviews", force: true do |t|
    t.integer "drink_id"
    t.integer "user_account_id"
    t.string  "comment"
    t.integer "rating"
  end

  create_table "service_statuses", force: true do |t|
    t.string "status", null: false
    t.string "tier",   null: false
  end

  create_table "steps", force: true do |t|
    t.string "step_description", null: false
  end

  create_table "user_accounts", force: true do |t|
    t.string "first_name", null: false
    t.string "last_name",  null: false
    t.string "email",      null: false
    t.string "user_name",  null: false
  end

  create_table "user_drink_libraries", force: true do |t|
    t.integer "user_account_id", null: false
    t.integer "drink_id",        null: false
  end

  create_table "venue_accounts", force: true do |t|
    t.string  "venue_name",       null: false
    t.integer "servie_status_id", null: false
    t.integer "user_account_id",  null: false
  end

  create_table "venue_drink_libraries", force: true do |t|
    t.integer "bar_id",   null: false
    t.integer "drink_id", null: false
  end

  create_table "venue_locations", force: true do |t|
    t.integer "bar_id",         null: false
    t.integer "address_number"
    t.string  "address_street"
    t.string  "city"
    t.string  "state_code"
    t.string  "country_code"
    t.integer "zip"
  end

  create_table "weight_types", force: true do |t|
    t.string "type_of_weight", null: false
    t.string "measure_type",   null: false
  end

end
