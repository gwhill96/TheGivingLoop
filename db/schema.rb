# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_06_113831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basket_items", force: :cascade do |t|
    t.bigint "basket_id", null: false
    t.bigint "donation_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "redeemed", default: false, null: false
    t.index ["basket_id"], name: "index_basket_items_on_basket_id"
    t.index ["donation_type_id"], name: "index_basket_items_on_donation_type_id"
  end

  create_table "baskets", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "guest_user"
    t.integer "amount_cents", default: 0, null: false
    t.string "state"
    t.string "checkout_session_id"
    t.index ["user_id"], name: "index_baskets_on_user_id"
  end

  create_table "charity_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_charity_profiles_on_user_id"
  end

  create_table "donation_types", force: :cascade do |t|
    t.string "name"
    t.bigint "charity_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "bio"
    t.string "photo_url"
    t.index ["charity_profile_id"], name: "index_donation_types_on_charity_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.boolean "charity", default: false
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "basket_items", "baskets"
  add_foreign_key "basket_items", "donation_types"
  add_foreign_key "baskets", "users"
  add_foreign_key "charity_profiles", "users"
  add_foreign_key "donation_types", "charity_profiles"
end
