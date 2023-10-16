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

ActiveRecord::Schema[7.0].define(version: 7) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "timezone"
    t.string "lang"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendar_dates", id: false, force: :cascade do |t|
    t.date "date"
    t.string "calendar_id", null: false
    t.string "exception_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_calendar_dates_on_calendar_id"
  end

  create_table "calendars", id: false, force: :cascade do |t|
    t.string "id"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_calendars_on_id", unique: true
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.string "short_name"
    t.string "long_name"
    t.string "desc"
    t.string "route_type"
    t.string "url"
    t.string "color"
    t.string "text_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_routes_on_agency_id"
  end

  create_table "stop_times", id: false, force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.time "arrival"
    t.time "departure"
    t.bigint "stop_id", null: false
    t.string "stop_sequence"
    t.string "stop_headsign"
    t.string "pickup_type"
    t.string "drop_off_type"
    t.string "shape_dist_traveled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stop_id"], name: "index_stop_times_on_stop_id"
    t.index ["trip_id"], name: "index_stop_times_on_trip_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "stop"
    t.string "lat"
    t.string "lon"
    t.string "url"
    t.string "location_type"
    t.integer "parent_station"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.string "calendar_id", null: false
    t.string "trip_headsign"
    t.string "trip_short_name"
    t.integer "direction_id"
    t.integer "block_id"
    t.integer "shape_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_id"], name: "index_trips_on_calendar_id"
    t.index ["route_id"], name: "index_trips_on_route_id"
  end

  add_foreign_key "calendar_dates", "calendars"
  add_foreign_key "routes", "agencies"
  add_foreign_key "stop_times", "stops"
  add_foreign_key "stop_times", "trips"
  add_foreign_key "trips", "calendars"
  add_foreign_key "trips", "routes"
end
