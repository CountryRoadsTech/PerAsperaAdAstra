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
FactoryBot.define do
  factory :satellite do
    name { "MyText" }
    created_by { :user }
    international_designator { "MyText" }
    norad_catalog_id { "" }
    object_type { "MyText" }
    country { "MyText" }
    launch_time { "2021-01-01 11:42:33" }
    launch_site { "MyText" }
    decay_time { "2021-01-01 11:42:33" }
    period { "9.99" }
    inclination { "9.99" }
    apogee { "9.99" }
    perigee { "9.99" }
    radar_cross_section_size { "MyText" }
    current { "MyText" }
  end
end
