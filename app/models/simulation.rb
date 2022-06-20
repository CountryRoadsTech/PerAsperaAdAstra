# frozen_string_literal: true

# == Schema Information
#
# Table name: simulations
#
#  id               :uuid             not null, primary key
#  computation_time :decimal(, )
#  computed_at      :datetime
#  name             :text             not null
#  slug             :text
#  solver_method    :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_simulations_on_name  (name) UNIQUE
#  index_simulations_on_slug  (slug) UNIQUE
#
class Simulation < ApplicationRecord
  has_rich_text :description

  validates :name, presence: true
  validates :name, uniqueness: true

  # Use the name attribute as the slug in this models URLs.
  extend FriendlyId
  friendly_id :name, use: :history

  def should_generate_new_friendly_id?
    slug.blank? or name_changed?
  end
end
