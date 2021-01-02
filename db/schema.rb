# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_02_002438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "orbits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "name"
    t.text "comment"
    t.bigint "user_id", null: false
    t.integer "ordinal"
    t.datetime "epoch"
    t.decimal "epoch_microseconds"
    t.decimal "mean_motion"
    t.decimal "eccentricity"
    t.decimal "inclination"
    t.decimal "right_ascension_of_ascending_node"
    t.decimal "argument_of_pericenter"
    t.decimal "mean_anomaly"
    t.integer "revolution_at_epoch"
    t.decimal "b_star"
    t.decimal "mean_motion_dot"
    t.decimal "mean_motion_ddot"
    t.decimal "semimajor_axis"
    t.decimal "period"
    t.decimal "apogee"
    t.decimal "perigee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orbits_on_user_id"
  end

  create_table "satellites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "norad_catalog_id"
    t.text "international_designator"
    t.bigint "user_id", null: false
    t.uuid "orbit_id", null: false
    t.boolean "decayed", default: false
    t.text "name"
    t.text "object_type"
    t.integer "ordinal"
    t.text "comment"
    t.text "originator"
    t.integer "ephemeris_type"
    t.integer "element_set_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_satellites_on_name"
    t.index ["user_id"], name: "index_satellites_on_user_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "orbits", "users"
  add_foreign_key "satellites", "users"
end
