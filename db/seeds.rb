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

transform_keys_hash = {
  "ORDINAL"=>"1",
  "COMMENT"=>"GENERATED VIA SPACETRACK.ORG API",
  "ORIGINATOR"=>"18 SPCS",
  "NORAD_CAT_ID"=>"44235",
  "OBJECT_NAME"=>"STARLINK-31",
  "OBJECT_TYPE"=>"PAYLOAD",
  "CLASSIFICATION_TYPE"=>"U",
  "INTLDES"=>"19029A",
  "EPOCH"=>"2020-10-01 07:31:19",
  "EPOCH_MICROSECONDS"=>"437888",
  "MEAN_MOTION"=>"16.46847225",
  "ECCENTRICITY"=>"0.0009041",
  "INCLINATION"=>"52.9736",
  "RA_OF_ASC_NODE"=>"36.3928",
  "ARG_OF_PERICENTER"=>"295.9879",
  "MEAN_ANOMALY"=>"160.3065",
  "EPHEMERIS_TYPE"=>"0",
  "ELEMENT_SET_NO"=>"999",
  "REV_AT_EPOCH"=>"7697",
  "BSTAR"=>"0.00018159",
  "MEAN_MOTION_DOT"=>"0.09808971",
  "MEAN_MOTION_DDOT"=>"0.000012623",
  "FILE"=>"2839167",
  "TLE_LINE0"=>"0 STARLINK-31",
  "TLE_LINE1"=>"1 44235U 19029A   20275.31341942  .09808971  12623-4  18159-3 0  9999",
  "TLE_LINE2"=>"2 44235  52.9736  36.3928 0009041 295.9879 160.3065 16.46847225 76971",
  "OBJECT_ID"=>"2019-029A",
  "OBJECT_NUMBER"=>"44235",
  "SEMIMAJOR_AXIS"=>"6525.788",
  "PERIOD"=>"87.439",
  "APOGEE"=>"153.553",
  "PERIGEE"=>"141.753",
  "DECAYED"=>"1"
}
request_data = JSON.parse(starlink_request.body) # Convert the response data to JSON.

request_data.each do |datum|
  transformed_keys_datum = datum.transform_keys do |key|
    transform_keys_hash[key]
  end

  Satellite.create!(transformed_keys_datum.merge(user_id: user.id))
end
