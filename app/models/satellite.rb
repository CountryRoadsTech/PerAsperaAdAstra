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
class Satellite < ApplicationRecord
  belongs_to :user, inverse_of: :satellites
  belongs_to :orbit, inverse_of: :satellites

  has_paper_trail # Changes to this model are tracked and stored in the database.

  after_create_commit { broadcast_prepend_to 'satellites' }
  after_update_commit { broadcast_replace_to 'satellites' }
  after_destroy_commit { broadcast_remove_to 'satellites' }

  validates :name, presence: true # Requires every satellite have a name.
end
