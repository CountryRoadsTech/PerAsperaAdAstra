# frozen_string_literal: true

require 'faker'

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
FactoryBot.define do
  factory :simulation do
    name { "#{Faker::Science.unique.scientist}s Simulation" }
    description { Faker::Lorem.paragraphs(number: 3).join("\n") }
    solver_method { 'Runge-Kutta 45 (RK45)' }
    universe

    after :create do |simulation|
      simulation.universe ||= create(:universe, simulation: simulation)
    end
  end
end
