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

ActiveRecord::Schema.define(version: 20160615200955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.integer  "studio_id"
    t.string   "instructor"
    t.string   "title"
    t.text     "description"
    t.string   "category_tags",              array: true
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["studio_id"], name: "index_courses_on_studio_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["course_id"], name: "index_registrations_on_course_id", using: :btree
    t.index ["customer_id"], name: "index_registrations_on_customer_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "course_id"
    t.date     "start_date"
    t.integer  "number_of_weeks"
    t.string   "day_of_week"
    t.datetime "time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["course_id"], name: "index_schedules_on_course_id", using: :btree
  end

  create_table "studios", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses", "studios"
  add_foreign_key "registrations", "courses"
  add_foreign_key "registrations", "customers"
  add_foreign_key "schedules", "courses"
end
