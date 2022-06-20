# frozen_string_literal: true

# == Schema Information
#
# Table name: universes
#
#  id                  :uuid             not null, primary key
#  end_time            :decimal(, )      not null
#  number_of_timesteps :integer          not null
#  start_time          :decimal(, )      default(0.0), not null
#  timestep            :decimal(, )      not null
#  timesteps           :decimal(, )      default([]), is an Array
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  simulation_id       :uuid             not null
#
# Indexes
#
#  index_universes_on_simulation_id  (simulation_id)
#
# Foreign Keys
#
#  fk_rails_7ac1c0e6f8  (simulation_id => simulations.id)
#
require 'rails_helper'

RSpec.describe Universe, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
