# == Schema Information
#
# Table name: satellites
#
#  id                       :uuid             not null, primary key
#  comment                  :text
#  decayed                  :boolean          default(FALSE)
#  element_set_number       :integer
#  ephemeris_type           :integer
#  international_designator :text
#  name                     :text
#  object_type              :text
#  ordinal                  :integer
#  originator               :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  norad_catalog_id         :text
#  orbit_id                 :uuid             not null
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_satellites_on_name     (name)
#  index_satellites_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_93a2b551ac  (user_id => users.id)
#

require 'json'

module SatellitesHelper
  # Logins to and queries space-track.org for the latest information about the given request.
  def request_from_space_track_org(request, user = nil)
    login_cookie = login
    response = make_request(request, login_cookie)
    convert_satellite_data(response, user)
  end

  private

  BASE_URL = 'https://www.space-track.org'
  LOGIN_REQUEST = '/ajaxauth/login'

  LOCALIZE_KEYS = {
    'ORDINAL' => 'ordinal',
    'COMMENT' => 'comment',
    'ORIGINATOR' => 'originator',
    'NORAD_CAT_ID' => 'norad_catalog_id',
    'OBJECT_NAME' => 'name',
    'OBJECT_TYPE' => 'object_type',
    'INTLDES' => 'international_designator',
    'EPOCH' => 'epoch',
    'EPOCH_MICROSECONDS' => 'epoch_microseconds',
    'MEAN_MOTION' => 'mean_motion',
    'ECCENTRICITY' => 'eccentricity',
    'INCLINATION' => 'inclination',
    'RA_OF_ASC_NODE' => 'right_ascension_of_ascending_node',
    'ARG_OF_PERICENTER' => 'argument_of_pericenter',
    'MEAN_ANOMALY' => 'mean_anomaly',
    'EPHEMERIS_TYPE' => 'ephemeris_type',
    'ELEMENT_SET_NO' => 'element_set_number',
    'REV_AT_EPOCH' => 'revolution_at_epoch',
    'BSTAR' => 'b_star',
    'MEAN_MOTION_DOT' => 'mean_motion_dot',
    'MEAN_MOTION_DDOT' => 'mean_motion_ddot',
    'SEMIMAJOR_AXIS' => 'semimajor_axis',
    'PERIOD' => 'period',
    'APOGEE' => 'apogee',
    'PERIGEE' => 'perigee',
    'DECAYED' => 'decayed'
  }.freeze
  KEYS_TO_REMOVE = %w[CLASSIFICATION_TYPE TLE_LINE0 TLE_LINE1 TLE_LINE2 FILE OBJECT_ID OBJECT_NUMBER].freeze
  ORBIT_KEYS_REFERENCE = %w[epoch epoch_microseconds mean_motion eccentricity inclination right_ascension_of_ascending_node argument_of_pericenter mean_anomaly revolution_at_epoch b_star mean_motion_dot mean_motion_ddot semimajor_axis period apogee perigee].freeze
  SATELLITE_KEYS_REFERENCE = %w[originator]

  # Login to space-track.org, and return the authentication cookie.
  def login
    login_response = Faraday.post(BASE_URL + LOGIN_REQUEST) do |request|
      request.body = { identity: Rails.application.credentials.spacetrackorg[:username],
                       password: Rails.application.credentials.spacetrackorg[:password]
      }
    end

    unless login_response.status == 200
      logger.error login_response.status
      logger.error login_response.headers
      logger.error login_response.body
      logger.error 'Unable to login to space-track.org!'
    end

    login_response.headers[:set_cookie]
  end

  # Query space-track.org for the latest information about request and return the response.
  def make_request(request, login_cookie)
    response = Faraday.get(BASE_URL + request) do |req|
      req.headers['Cookie'] = login_cookie
    end

    unless response.status == 200
      logger.error response.status
      logger.error response.headers
      logger.error response.body
      raise "Unable to get space-track.org data for request: #{request}"
    end

    response
  end

  # Converts the satellite data from space-track.org format to the locally used format.
  def convert_satellite_data(response, user)
    response_data = JSON.parse(response.body) # Convert the response data to JSON.

    satellites = []
    orbits = []

    response_data.each do |datum|

      data = datum.except!(KEYS_TO_REMOVE) # Remove all the keys from the KEYS_TO_REMOVE array.
      data.transform_keys! do |key|
        LOCALIZE_KEYS[key]
      end
      data.delete(nil) # Remove any nil valued keys from the keys.

      satellite_data = {}
      orbit_data = {}
      data.each do |key, value|
        if ORBIT_KEYS_REFERENCE.include?(key)
          orbit_data[key] = value
        elsif KEYS_TO_REMOVE.include?(key)
          # continue
        else
          satellite_data[key] = value
        end
      end

      orbit_data['name'] = "#{data['name']}'s Orbit"
      orbit_data['user_id'] = user
      orbit = Orbit.new(orbit_data)
      orbit.user = user

      satellite = Satellite.new(satellite_data)
      satellite.user = user
      satellite.orbit = orbit

      satellites.append(satellite)
      orbits.append(orbit)
    end

    { satellites: satellites, orbits: orbits }
  end
end
