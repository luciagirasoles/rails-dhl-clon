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

ActiveRecord::Schema.define(version: 2019_04_29_215922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "senders", force: :cascade do |t|
    t.string "store_name"
    t.string "order_id"
    t.string "integer"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipment_locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.string "reception_date"
    t.string "datetime"
    t.string "shipment"
    t.string "references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.string "tracking_id"
    t.string "origin_address"
    t.string "destination_address"
    t.string "weight"
    t.string "integer"
    t.string "reception_date"
    t.string "date"
    t.string "estimated_delivery_date"
    t.string "datetime"
    t.string "delivered_date"
    t.string "freight_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipient_id"
    t.bigint "sender_id"
    t.index ["recipient_id"], name: "index_shipments_on_recipient_id"
    t.index ["sender_id"], name: "index_shipments_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "city"
    t.string "country"
    t.string "address"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "shipments", "users", column: "recipient_id"
  add_foreign_key "shipments", "users", column: "sender_id"
end
