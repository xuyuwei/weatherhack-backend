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

ActiveRecord::Schema.define(version: 20150117165818) do

  create_table "conditions", force: :cascade do |t|
    t.string "hour"
    t.string "condition"
    t.string "condition_url"
    t.string "city"
  end

  create_table "places", force: :cascade do |t|
    t.string   "place_id"
    t.string   "city"
    t.string   "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.decimal  "lat"
    t.decimal  "lng"
    t.float    "rating"
    t.string   "icon_url"
    t.string   "address"
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
