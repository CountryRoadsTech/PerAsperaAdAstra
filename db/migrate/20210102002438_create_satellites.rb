class CreateSatellites < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :satellites, id: :uuid do |t|
      t.text :norad_catalog_id
      t.text :international_designator

      t.belongs_to :user, null: false, foreign_key: true
      t.uuid :orbit_id, null: false, foreign_key: true
      t.boolean :decayed, default: false

      t.text :name, index: true, unique: true
      t.text :object_type
      t.integer :ordinal
      t.text :comment
      t.text :originator

      t.integer :ephemeris_type
      t.integer :element_set_number

      t.timestamps
    end
  end
end
