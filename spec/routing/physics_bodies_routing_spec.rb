# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhysicsBodiesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/physics_bodies').to route_to('physics_bodies#index')
    end

    it 'routes to #new' do
      expect(get: '/physics_bodies/new').to route_to('physics_bodies#new')
    end

    it 'routes to #show' do
      expect(get: '/physics_bodies/1').to route_to('physics_bodies#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/physics_bodies/1/edit').to route_to('physics_bodies#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/physics_bodies').to route_to('physics_bodies#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/physics_bodies/1').to route_to('physics_bodies#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/physics_bodies/1').to route_to('physics_bodies#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/physics_bodies/1').to route_to('physics_bodies#destroy', id: '1')
    end
  end
end
