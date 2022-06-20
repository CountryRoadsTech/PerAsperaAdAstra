# frozen_string_literal: true

json.array! @physics_bodies, partial: 'physics_bodies/physics_body', as: :physics_body
