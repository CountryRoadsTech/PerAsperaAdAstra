# == Schema Information
#
# Table name: satellites
#
#  id                                :uuid             not null, primary key
#  apogee                            :decimal(, )
#  argument_of_pericenter            :decimal(, )
#  b_star                            :decimal(, )
#  comment                           :text
#  decayed                           :boolean          default(FALSE)
#  eccentricity                      :decimal(, )
#  element_set_number                :integer
#  ephemeris_type                    :integer
#  epoch                             :datetime
#  epoch_microseconds                :decimal(, )
#  inclination                       :decimal(, )
#  international_designator          :text
#  mean_anomaly                      :decimal(, )
#  mean_motion                       :decimal(, )
#  mean_motion_ddot                  :decimal(, )
#  mean_motion_dot                   :decimal(, )
#  name                              :text
#  object_type                       :text
#  ordinal                           :integer
#  originator                        :text
#  perigee                           :decimal(, )
#  period                            :decimal(, )
#  revolution_at_epoch               :integer
#  right_ascension_of_ascending_node :decimal(, )
#  semimajor_axis                    :decimal(, )
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  norad_catalog_id                  :text
#  user_id                           :bigint
#
# Indexes
#
#  index_satellites_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Satellite, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
