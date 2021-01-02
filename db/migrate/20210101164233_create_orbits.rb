class CreateOrbits < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :orbits, id: :uuid do |t|
      t.text :name
      t.text :comment
      t.belongs_to :user, null: false, foreign_key: true

      t.integer :ordinal
      t.datetime :epoch
      t.decimal :epoch_microseconds
      t.decimal :mean_motion
      t.decimal :eccentricity
      t.decimal :inclination
      t.decimal :right_ascension_of_ascending_node
      t.decimal :argument_of_pericenter
      t.decimal :mean_anomaly
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
