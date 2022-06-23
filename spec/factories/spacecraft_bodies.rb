# == Schema Information
#
# Table name: physics_bodies
#
#  id                 :uuid             not null, primary key
#  accelerations_x    :decimal(, )      default([]), is an Array
#  accelerations_y    :decimal(, )      default([]), is an Array
#  accelerations_z    :decimal(, )      default([]), is an Array
#  forces_x           :decimal(, )      default([]), is an Array
#  forces_y           :decimal(, )      default([]), is an Array
#  forces_z           :decimal(, )      default([]), is an Array
#  gm                 :decimal(, )
#  initial_position_x :decimal(, )      not null
#  initial_position_y :decimal(, )      not null
#  initial_position_z :decimal(, )      not null
#  initial_velocity_x :decimal(, )      not null
#  initial_velocity_y :decimal(, )      not null
#  initial_velocity_z :decimal(, )      not null
#  name               :text             not null
#  positions_x        :decimal(, )      default([]), is an Array
#  positions_y        :decimal(, )      default([]), is an Array
#  positions_z        :decimal(, )      default([]), is an Array
#  radius             :decimal(, )      not null
#  slug               :text
#  type               :text
#  velocities_x       :decimal(, )      default([]), is an Array
#  velocities_y       :decimal(, )      default([]), is an Array
#  velocities_z       :decimal(, )      default([]), is an Array
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  simulation_id      :uuid             not null
#
# Indexes
#
#  index_physics_bodies_on_name           (name) UNIQUE
#  index_physics_bodies_on_simulation_id  (simulation_id)
#  index_physics_bodies_on_slug           (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_0453254253  (simulation_id => simulations.id)
#
FactoryBot.define do
  factory :spacecraft_body do
    
  end
end
