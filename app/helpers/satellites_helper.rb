# == Schema Information
#
# Table name: satellites
#
#  id                       :bigint           not null, primary key
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
#
module SatellitesHelper
end
