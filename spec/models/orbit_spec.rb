# == Schema Information
#
# Table name: orbits
#
#  id                                :uuid             not null, primary key
#  apogee                            :decimal(, )
#  argument_of_pericenter            :decimal(, )
#  b_star                            :decimal(, )
#  comment                           :text
#  eccentricity                      :decimal(, )
#  epoch                             :datetime
#  epoch_microseconds                :decimal(, )
#  inclination                       :decimal(, )
#  mean_anomaly                      :decimal(, )
#  mean_motion                       :decimal(, )
#  mean_motion_ddot                  :decimal(, )
#  mean_motion_dot                   :decimal(, )
#  name                              :text
#  ordinal                           :integer
#  perigee                           :decimal(, )
#  period                            :decimal(, )
#  revolution_at_epoch               :integer
#  right_ascension_of_ascending_node :decimal(, )
#  semimajor_axis                    :decimal(, )
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  user_id                           :bigint           not null
#
# Indexes
#
#  index_orbits_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_39ebaa91bc  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Orbit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
