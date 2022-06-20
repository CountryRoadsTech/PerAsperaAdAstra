# frozen_string_literal: true

json.extract! universe, :id, :simulation_id, :start_time, :end_time, :timestep, :number_of_timesteps, :timesteps,
              :created_at, :updated_at
json.url universe_url(universe, format: :json)
