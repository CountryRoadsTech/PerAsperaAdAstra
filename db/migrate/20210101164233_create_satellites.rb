class CreateSatellites < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :satellites, id: :uuid do |t|
      t.text :norad_catalog_id
      t.text :international_designator

      t.belongs_to :user

      t.text :name
      t.text :object_type
      t.integer :ordinal
      t.text :comment
      t.text :originator

      t.boolean :decayed, default: false

      t.datetime :epoch
      t.decimal :epoch_microseconds
      t.decimal :mean_motion
      t.decimal :eccentricity
      t.decimal :inclination
      t.decimal :right_ascension_of_ascending_node
      t.decimal :argument_of_pericenter
      t.decimal :mean_anomaly
      t.integer :ephemeris_type
      t.integer :element_set_number
      t.integer :revolution_at_epoch
      t.decimal :b_star
      t.decimal :mean_motion_dot
      t.decimal :mean_motion_ddot
      t.decimal :semimajor_axis
      t.decimal :period
      t.decimal :apogee
      t.decimal :perigee

      t.timestamps
    end
  end
end
