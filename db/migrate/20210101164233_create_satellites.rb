class CreateSatellites < ActiveRecord::Migration[6.0]
  def change
    create_table :satellites do |t|
      t.text :name
      t.belongs_to :user
      t.text :international_designator
      t.bigint :norad_catalog_id
      t.text :object_type
      t.text :country
      t.datetime :launch_time
      t.text :launch_site
      t.datetime :decay_time
      t.decimal :period
      t.decimal :inclination
      t.decimal :apogee
      t.decimal :perigee
      t.text :radar_cross_section_size
      t.text :current

      t.timestamps
    end
  end
end
