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

ActiveRecord::Schema[8.1].define(version: 2026_06_06_210050) do
  create_table "boats", force: :cascade do |t|
    t.string "boat_type"
    t.integer "capacity"
    t.string "color"
    t.integer "condition_level"
    t.datetime "created_at", null: false
    t.date "last_service_date"
    t.integer "point_id", null: false
    t.string "serial_number"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["point_id"], name: "index_boats_on_point_id"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.datetime "end_time"
    t.integer "event_type", default: 0
    t.integer "point_id"
    t.integer "route_id"
    t.datetime "start_time"
    t.integer "status", default: 0
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "visibility", default: 0
    t.index ["point_id"], name: "index_events_on_point_id"
    t.index ["route_id"], name: "index_events_on_route_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "franchises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "owner_id"
    t.integer "status", default: 0
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_franchises_on_owner_id"
  end

  create_table "gps_track_points", force: :cascade do |t|
    t.float "accuracy"
    t.float "battery_level"
    t.datetime "created_at", null: false
    t.decimal "lat", precision: 10, scale: 7
    t.decimal "lng", precision: 10, scale: 7
    t.float "speed"
    t.datetime "timestamp"
    t.integer "track_id", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_gps_track_points_on_track_id"
  end

  create_table "gps_tracks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "ended_at"
    t.integer "event_id", null: false
    t.datetime "started_at"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["event_id"], name: "index_gps_tracks_on_event_id"
    t.index ["user_id"], name: "index_gps_tracks_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "action_type"
    t.datetime "created_at", null: false
    t.string "entity_id"
    t.string "entity_type"
    t.integer "event_id", null: false
    t.text "payload"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["event_id"], name: "index_logs_on_event_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "end_time"
    t.integer "event_id", null: false
    t.integer "judge_id"
    t.integer "score_a"
    t.integer "score_b"
    t.datetime "start_time"
    t.integer "status", default: 0
    t.integer "team_a_id"
    t.integer "team_b_id"
    t.integer "tournament_id"
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_matches_on_event_id"
    t.index ["judge_id"], name: "index_matches_on_judge_id"
    t.index ["team_a_id"], name: "index_matches_on_team_a_id"
    t.index ["team_b_id"], name: "index_matches_on_team_b_id"
    t.index ["tournament_id"], name: "index_matches_on_tournament_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.string "currency"
    t.integer "event_id", null: false
    t.string "external_transaction_id"
    t.string "payment_provider"
    t.integer "payment_status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["event_id"], name: "index_payments_on_event_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "points", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", null: false
    t.integer "franchise_id"
    t.decimal "lat", precision: 10, scale: 7
    t.decimal "lng", precision: 10, scale: 7
    t.integer "point_type"
    t.integer "status", default: 0
    t.string "timezone"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["franchise_id"], name: "index_points_on_franchise_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "boat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "end_time"
    t.integer "event_id", null: false
    t.string "payment_id"
    t.datetime "start_time"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["boat_id"], name: "index_rentals_on_boat_id"
    t.index ["event_id"], name: "index_rentals_on_event_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "route_points", force: :cascade do |t|
    t.integer "checkpoint_type"
    t.datetime "created_at", null: false
    t.string "description"
    t.decimal "lat"
    t.decimal "lng"
    t.integer "order_index"
    t.integer "route_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_route_points_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "difficulty"
    t.float "distance_km"
    t.integer "estimated_duration"
    t.integer "route_type"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "team_members", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "joined_at"
    t.integer "role"
    t.integer "team_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["team_id"], name: "index_team_members_on_team_id"
    t.index ["user_id"], name: "index_team_members_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "captain_id"
    t.datetime "created_at", null: false
    t.integer "status", default: 0
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["captain_id"], name: "index_teams_on_captain_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "event_id", null: false
    t.integer "format"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tournaments_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "accessibility_level", default: 0
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "medical_flags"
    t.string "phone"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role", default: 0
    t.integer "status", default: 0
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["status"], name: "index_users_on_status"
  end

  add_foreign_key "boats", "points"
  add_foreign_key "events", "points"
  add_foreign_key "events", "routes"
  add_foreign_key "events", "users"
  add_foreign_key "franchises", "users", column: "owner_id"
  add_foreign_key "gps_track_points", "gps_tracks", column: "track_id"
  add_foreign_key "gps_tracks", "events"
  add_foreign_key "gps_tracks", "users"
  add_foreign_key "logs", "events"
  add_foreign_key "logs", "users"
  add_foreign_key "matches", "events"
  add_foreign_key "matches", "teams", column: "team_a_id"
  add_foreign_key "matches", "teams", column: "team_b_id"
  add_foreign_key "matches", "tournaments"
  add_foreign_key "matches", "users", column: "judge_id"
  add_foreign_key "payments", "events"
  add_foreign_key "payments", "users"
  add_foreign_key "points", "franchises"
  add_foreign_key "rentals", "boats"
  add_foreign_key "rentals", "events"
  add_foreign_key "rentals", "users"
  add_foreign_key "route_points", "routes"
  add_foreign_key "team_members", "teams"
  add_foreign_key "team_members", "users"
  add_foreign_key "teams", "users", column: "captain_id"
  add_foreign_key "tournaments", "events"
end
