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

ActiveRecord::Schema.define(version: 20160831175332) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.string   "site_name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "tag_line"
    t.integer  "show_id"
    t.index ["show_id"], name: "index_cities_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.datetime "start_datetime"
    t.string   "venue"
    t.string   "facebook_event"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "city_id"
    t.index ["city_id"], name: "index_shows_on_city_id"
  end

end
