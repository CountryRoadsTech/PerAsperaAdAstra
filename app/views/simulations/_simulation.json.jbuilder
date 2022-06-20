# frozen_string_literal: true

json.extract! simulation, :id, :name, :slug, :description, :solver_method, :computation_time, :computed_at,
              :created_at, :updated_at
json.url simulation_url(simulation, format: :json)
json.description simulation.description.to_s
