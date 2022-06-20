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
require 'faker'

FactoryBot.define do
  factory :universe do
    start_time { Faker::Number.positive }
    end_time { Faker::Number.between(from: start_time + 1, to: start_time + 1_000_000) }
    number_of_timesteps { Faker::Number.between(from: 10, to: 1000) }

    before :create do |universe|
      universe.simulation ||= create(:simulation, universe: universe)
    end
  end

  factory :universe_without_start_time do
    start_time { nil }
  end

  factory :universe_without_end_time do
    end_time { nil }
  end

  factory :universe_without_number_of_timesteps do
    number_of_timesteps { nil }
  end
end
