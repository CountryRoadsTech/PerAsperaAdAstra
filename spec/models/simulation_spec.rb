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
require 'rails_helper'

RSpec.describe Simulation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
