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
class Satellite < ApplicationRecord
  belongs_to :user, inverse_of: :satellites

  has_paper_trail # Changes to this model are tracked and stored in the database.
end
