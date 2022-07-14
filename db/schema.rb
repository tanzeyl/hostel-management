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

ActiveRecord::Schema[7.0].define(version: 2022_07_14_095908) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hostel_rooms", force: :cascade do |t|
    t.string "studentname"
    t.string "hostelname"
    t.bigint "seater"
    t.boolean "ac"
    t.bigint "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "available"
    t.bigint "price"
    t.bigint "occupants"
  end

  create_table "hostels", force: :cascade do |t|
    t.string "name"
    t.bigint "floors"
    t.bigint "four_seater"
    t.bigint "three_seater"
    t.bigint "two_seater"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "for"
  end

  create_table "kitchens", force: :cascade do |t|
    t.string "item"
    t.bigint "quantity"
    t.bigint "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.boolean "breakfast"
    t.boolean "lunch"
    t.boolean "dinner"
    t.boolean "tiffin"
    t.bigint "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.text "todo_text"
    t.date "due_date"
    t.boolean "completed"
    t.bigint "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "password_digest"
    t.string "last_name"
    t.string "gender"
    t.bigint "room_id"
    t.bigint "meal_id"
    t.string "role"
  end

end
