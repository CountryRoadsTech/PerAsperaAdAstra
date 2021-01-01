# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

####################################################################################################
# Create an admin user
####################################################################################################

user = User.new(email: 'email@example.com', password: 'password', password_confirmation: 'password')
user.skip_confirmation!
user.admin = true

user.save

####################################################################################################
# Login to space-track.org, and store the returned cookie.
####################################################################################################

base_url = 'https://www.space-track.org'
login_request = '/ajaxauth/login'

login_response = Faraday.post(base_url + login_request) do |request|
  request.body = { identity: Rails.application.credentials.spacetrackorg[:username],
                   password: Rails.application.credentials.spacetrackorg[:password]
  }
end

unless login_response.status == 200
  puts login_response.status
  puts login_response.headers
  puts login_response.body
  raise RuntimeError, 'Unable to login to space-track.org!'
end

login_cookie = login_response.headers[:set_cookie]

####################################################################################################
# Query space-track.org for the latest information on starlink satellites.
####################################################################################################

basic_space_data_query = "/basicspacedata/query"
find_starlink_query = "/class/tle_latest/NORAD_CAT_ID/%3E40000/ORDINAL/1/OBJECT_NAME/STARLINK~~/format/json/orderby/NORAD_CAT_ID%20asc"

starlink_request = Faraday.get(base_url + basic_space_data_query + find_starlink_query) do |req|
  req.headers['Cookie'] = login_cookie
end

unless starlink_request.status == 200
  puts starlink_request.status
  puts starlink_request.headers
  puts starlink_request.body
  raise RuntimeError, "Unable to get space-track.org data for request: #{find_starlink_query}"
end

####################################################################################################
# Convert the space-track.org satellite data and store it in the local database.
####################################################################################################

transform_keys = {
  "ORDINAL"=>"ordinal",
  "COMMENT"=>"comment",
  "ORIGINATOR"=>"originator",
  "NORAD_CAT_ID"=>"norad_catalog_id",
  "OBJECT_NAME"=>"name",
  "OBJECT_TYPE"=>"object_type",
  "INTLDES"=>"international_designator",
  "EPOCH"=>"epoch",
  "EPOCH_MICROSECONDS"=>"epoch_microseconds",
  "MEAN_MOTION"=>"mean_motion",
  "ECCENTRICITY"=>"eccentricity",
  "INCLINATION"=>"inclination",
  "RA_OF_ASC_NODE"=>"right_ascension_of_ascending_node",
  "ARG_OF_PERICENTER"=>"argument_of_pericenter",
  "MEAN_ANOMALY"=>"mean_anomaly",
  "EPHEMERIS_TYPE"=>"ephemeris_type",
  "ELEMENT_SET_NO"=>"element_set_number",
  "REV_AT_EPOCH"=>"revolution_at_epoch",
  "BSTAR"=>"b_star",
  "MEAN_MOTION_DOT"=>"mean_motion_dot",
  "MEAN_MOTION_DDOT"=>"mean_motion_ddot",
  "SEMIMAJOR_AXIS"=>"semimajor_axis",
  "PERIOD"=>"period",
  "APOGEE"=>"apogee",
  "PERIGEE"=>"perigee",
  "DECAYED"=>"decayed"
}
REMOVE_KEYS = [
  "CLASSIFICATION_TYPE",
  "TLE_LINE0",
  "TLE_LINE1",
  "TLE_LINE2",
  "FILE",
  "OBJECT_ID",
  "OBJECT_NUMBER"
]

request_data = JSON.parse(starlink_request.body) # Convert the response data to JSON.

request_data.each do |datum|
  transformed_keys_datum = datum.transform_keys do |key|
    transform_keys[key]
  end
  transformed_keys_datum.except!(REMOVE_KEYS) # Remove all the keys from the REMOVE_KEYS array.
  transformed_keys_datum.merge!(user: user) # Add the current user as the creator of the satellite.
  transformed_keys_datum.delete(nil) # Remove any nil valued keys from the data.

  Satellite.create!(transformed_keys_datum)
end
