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

ActiveRecord::Schema.define(version: 2018_04_24_062523) do

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "shift_id"
    t.integer "guest_id"
    t.integer "guest_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_slot"
    t.integer "table_id"
    t.index ["guest_id"], name: "index_reservations_on_guest_id"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
    t.index ["shift_id"], name: "index_reservations_on_shift_id"
    t.index ["table_id"], name: "index_reservations_on_table_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.string "name"
    t.time "start_time"
    t.time "end_time"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_shifts_on_restaurant_id"
  end

  create_table "tables", force: :cascade do |t|
    t.string "name"
    t.integer "minimum_capacity"
    t.integer "maximum_capacity"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_tables_on_restaurant_id"
  end

end
