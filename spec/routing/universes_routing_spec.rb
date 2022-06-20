# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UniversesController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/universes/1').to route_to('universes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/universes/1/edit').to route_to('universes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/universes').to route_to('universes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/universes/1').to route_to('universes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/universes/1').to route_to('universes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/universes/1').to route_to('universes#destroy', id: '1')
    end
  end
end
