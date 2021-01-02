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
