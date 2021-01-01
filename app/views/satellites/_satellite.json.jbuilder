json.extract! satellite, :id, :name, :international_designator, :norad_catalog_id, :object_type, :country, :launch_time, :launch_site, :decay_time, :period, :inclination, :apogee, :perigee, :radar_cross_section_size, :current, :created_at, :updated_at
json.url satellite_url(satellite, format: :json)
