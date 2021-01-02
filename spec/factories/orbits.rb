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
FactoryBot.define do
  factory :orbit do
    satellites { nil }
    name { "MyText" }
    comment { "MyText" }
    user { nil }
    epoch { "2021-01-01 19:24:38" }
    epoch_microseconds { "9.99" }
    mean_motion { "9.99" }
    eccentricicty { "9.99" }
    inclination { "9.99" }
    right_ascension_of_ascending_node { "9.99" }
    argument_of_pericenter { "9.99" }
    mean_anomaly { "9.99" }
    revolution_at_epoch { 1 }
    b_star { "9.99" }
    mean_motion_dot { "9.99" }
    mean_motino_ddot { "9.99" }
    semimajor_axis { "9.99" }
    period { "9.99" }
    apogee { "9.99" }
    perigee { "9.99" }
  end
end
