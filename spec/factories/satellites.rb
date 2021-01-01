# == Schema Information
#
# Table name: satellites
#
#  id                       :uuid             not null, primary key
#  apogee                   :decimal(, )
#  country                  :text
#  current                  :text
#  decay_time               :datetime
#  inclination              :decimal(, )
#  international_designator :text
#  launch_site              :text
#  launch_time              :datetime
#  name                     :text
#  object_type              :text
#  perigee                  :decimal(, )
#  period                   :decimal(, )
#  radar_cross_section_size :text
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  norad_catalog_id         :bigint
#  user_id                  :bigint
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
