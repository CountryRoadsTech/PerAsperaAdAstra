# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create an admin user.
user = User.new(email: 'basicexample@countryroads.tech', password: 'password', password_confirmation: 'password')
user.skip_confirmation!
user.admin = true
user.save!

include SatellitesHelper
require 'pry'

# Load data about all of SpaceX's Starlink satellites.
basic_space_data_query = '/basicspacedata/query'
find_starlink_query = '/class/tle_latest/NORAD_CAT_ID/%3E40000/ORDINAL/1/OBJECT_NAME/STARLINK~~/format/json/orderby/NORAD_CAT_ID%20asc'
request = basic_space_data_query + find_starlink_query

sats_and_orbits = request_from_space_track_org(request, user = user)
sats_and_orbits[:satellites].each do |satellite|
  satellite.save!
end
sats_and_orbits[:orbits].each do |orbit|
  orbit.save!
end
