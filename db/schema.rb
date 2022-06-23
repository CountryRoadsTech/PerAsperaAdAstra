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

ActiveRecord::Schema[7.0].define(version: 2022_06_20_160426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.uuid "record_id", null: false
    t.uuid "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.uuid "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "physics_bodies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "simulation_id", null: false
    t.text "name", null: false
    t.text "slug"
    t.decimal "initial_position_x", null: false
    t.decimal "initial_position_y", null: false
    t.decimal "initial_position_z", null: false
    t.decimal "initial_velocity_x", null: false
    t.decimal "initial_velocity_y", null: false
    t.decimal "initial_velocity_z", null: false
    t.decimal "positions_x", default: [], array: true
    t.decimal "positions_y", default: [], array: true
    t.decimal "positions_z", default: [], array: true
    t.decimal "velocities_x", default: [], array: true
    t.decimal "velocities_y", default: [], array: true
    t.decimal "velocities_z", default: [], array: true
    t.decimal "accelerations_x", default: [], array: true
    t.decimal "accelerations_y", default: [], array: true
    t.decimal "accelerations_z", default: [], array: true
    t.decimal "forces_x", default: [], array: true
    t.decimal "forces_y", default: [], array: true
    t.decimal "forces_z", default: [], array: true
    t.decimal "radius", null: false
    t.text "type"
    t.decimal "gm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_physics_bodies_on_name", unique: true
    t.index ["simulation_id"], name: "index_physics_bodies_on_simulation_id"
    t.index ["slug"], name: "index_physics_bodies_on_slug", unique: true
  end

  create_table "simulations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "name", null: false
    t.text "slug"
    t.text "solver_method"
    t.decimal "computation_time"
    t.datetime "computed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_simulations_on_name", unique: true
    t.index ["slug"], name: "index_simulations_on_slug", unique: true
  end

  create_table "universes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "simulation_id", null: false
    t.decimal "start_time", default: "0.0", null: false
    t.decimal "end_time", null: false
    t.decimal "timestep", null: false
    t.integer "number_of_timesteps", null: false
    t.decimal "timesteps", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["simulation_id"], name: "index_universes_on_simulation_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "physics_bodies", "simulations"
  add_foreign_key "universes", "simulations"
end
