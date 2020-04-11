# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_11_194017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bucket_list_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_bucket_list_items_on_restaurant_id"
    t.index ["user_id", "restaurant_id"], name: "index_bucket_list_items_on_user_id_and_restaurant_id", unique: true
    t.index ["user_id"], name: "index_bucket_list_items_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_favorites_on_restaurant_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "ottawa_favorites", force: :cascade do |t|
    t.integer "index"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_ottawa_favorites_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "yelp_id", null: false
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "yelp_url"
    t.string "phone"
    t.float "yelp_rating"
    t.string "price_level"
    t.index ["yelp_id"], name: "index_restaurants_on_yelp_id", unique: true
  end

  create_table "trending_restaurants", force: :cascade do |t|
    t.integer "index"
    t.bigint "restaurant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_trending_restaurants_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bucket_list_items", "restaurants"
  add_foreign_key "bucket_list_items", "users"
  add_foreign_key "favorites", "restaurants"
  add_foreign_key "favorites", "users"
  add_foreign_key "ottawa_favorites", "restaurants"
  add_foreign_key "trending_restaurants", "restaurants"
end
