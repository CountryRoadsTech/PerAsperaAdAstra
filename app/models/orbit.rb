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
class Orbit < ApplicationRecord
  belongs_to :user, inverse_of: :orbits
  has_many :satellites, inverse_of: :orbit

  has_paper_trail # Changes to this model are tracked and stored in the database.

  after_create_commit { broadcast_prepend_to 'orbits' }
  after_update_commit { broadcast_replace_to 'orbits' }
  after_destroy_commit { broadcast_remove_to 'orbits' }

  validates :name, presence: true # Requires every orbit have a name.
end
