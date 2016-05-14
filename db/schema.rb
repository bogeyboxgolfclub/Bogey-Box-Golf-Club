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

ActiveRecord::Schema.define(version: 20160513214808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "preferences", force: :cascade do |t|
    t.string   "style_on_course"
    t.string   "dress_for_work"
    t.string   "shirt_fit"
    t.string   "pant_fit"
    t.string   "shirt_size"
    t.string   "waist_size"
    t.string   "pant_length"
    t.string   "philosophy_on_clothing"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "email"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "zip_code"
    t.string   "stripe_card_token"
    t.string   "stripe_billing_address_line_1"
    t.string   "stripe_billing_address_zip"
    t.string   "stripe_billing_address_state"
    t.string   "stripe_billing_address_city"
    t.string   "stripe_billing_address_country"
    t.string   "stripe_billing_address_country_code"
    t.string   "stripe_shipping_name"
    t.string   "stripe_shipping_address_line_1"
    t.string   "stripe_shipping_address_zip"
    t.string   "stripe_shipping_address_state"
    t.string   "stripe_shipping_address_city"
    t.string   "stripe_shipping_address_country"
    t.string   "stripe_shipping_address_country_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
