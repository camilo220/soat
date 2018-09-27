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

ActiveRecord::Schema.define(version: 20180925183125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insurances", force: :cascade do |t|
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.string "payment_reference", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id", null: false
    t.bigint "rate_id", null: false
    t.index ["rate_id"], name: "index_insurances_on_rate_id"
    t.index ["vehicle_id"], name: "index_insurances_on_vehicle_id"
  end

  create_table "rates", force: :cascade do |t|
    t.string "code", null: false
    t.string "category", null: false
    t.string "sub_category", null: false
    t.string "unit_of_measurement", null: false
    t.integer "minimum_unit", null: false
    t.integer "maximum_unit", null: false
    t.integer "minimum_age"
    t.integer "maximum_age"
    t.float "bonus", null: false
    t.float "total", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_rates_on_code", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "document", null: false
    t.string "document_type", null: false
    t.string "phone", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license", null: false
    t.string "category", null: false
    t.string "sub_category", null: false
    t.string "unit_of_measurement", null: false
    t.integer "unit_value", null: false
    t.date "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "rate_id", null: false
    t.bigint "user_id", null: false
    t.index ["license"], name: "index_vehicles_on_license", unique: true
    t.index ["rate_id"], name: "index_vehicles_on_rate_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "vehicles", "rates"
end
