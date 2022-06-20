# frozen_string_literal: true

# This migration creates the Physics Body table and attributes.
class CreatePhysicsBodies < ActiveRecord::Migration[7.0]
  def change
    create_table :physics_bodies, id: :uuid do |t|
      t.belongs_to :simulation, null: false, foreign_key: true, type: :uuid

      t.text :name, null: false
      t.text :slug

      t.decimal :initial_position_x, null: false
      t.decimal :initial_position_y, null: false
      t.decimal :initial_position_z, null: false
      t.decimal :initial_velocity_x, null: false
      t.decimal :initial_velocity_y, null: false
      t.decimal :initial_velocity_z, null: false

      t.decimal :positions_x, array: true, default: []
      t.decimal :positions_y, array: true, default: []
      t.decimal :positions_z, array: true, default: []
      t.decimal :velocities_x, array: true, default: []
      t.decimal :velocities_y, array: true, default: []
      t.decimal :velocities_z, array: true, default: []
      t.decimal :accelerations_x, array: true, default: []
      t.decimal :accelerations_y, array: true, default: []
      t.decimal :accelerations_z, array: true, default: []
      t.decimal :forces_x, array: true, default: []
      t.decimal :forces_y, array: true, default: []
      t.decimal :forces_z, array: true, default: []

      t.timestamps
    end

    add_index :physics_bodies, :name, unique: true
    add_index :physics_bodies, :slug, unique: true
  end
end
