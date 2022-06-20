# frozen_string_literal: true

# This migration creates the Simulation table and attributes.
class CreateSimulations < ActiveRecord::Migration[7.0]
  def change
    create_table :simulations, id: :uuid do |t|
      t.text :name, null: false
      t.text :slug

      t.text :solver_method
      t.decimal :computation_time

      t.datetime :computed_at
      t.timestamps
    end

    add_index :simulations, :name, unique: true
    add_index :simulations, :slug, unique: true
  end
end
