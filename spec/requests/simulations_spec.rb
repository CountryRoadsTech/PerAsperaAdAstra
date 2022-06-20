# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/simulations', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Simulation. As you add validations to Simulation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    attributes_for(:simulation)
  end

  let(:invalid_attributes) do
    { title: 'Test', example: 'foobar' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      create(:simulation)
      get simulations_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      simulation = create(:simulation)
      get simulation_url(simulation)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_simulation_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      simulation = create(:simulation)
      get edit_simulation_url(simulation)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Simulation' do
        expect do
          post simulations_url, params: { simulation: valid_attributes }
        end.to change(Simulation, :count).by(1)
      end

      it 'redirects to the created simulation' do
        post simulations_url, params: { simulation: valid_attributes }
        expect(response).to redirect_to(simulation_url(Simulation.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Simulation' do
        expect do
          post simulations_url, params: { simulation: invalid_attributes }
        end.not_to change(Simulation, :count)
      end

      it 'renders an unprocessable entity status' do
        post simulations_url, params: { simulation: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        attributes_for(:simulation)
      end

      it 'updates the requested simulation' do
        simulation = create(:simulation)
        patch simulation_url(simulation), params: { simulation: new_attributes }
        simulation.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the simulation' do
        simulation = create(:simulation)
        patch simulation_url(simulation), params: { simulation: new_attributes }
        simulation.reload
        expect(response).to redirect_to(simulation_url(simulation))
      end
    end

    context 'with invalid parameters' do
      it 'renders a found status' do
        simulation = create(:simulation)
        patch simulation_url(simulation), params: { simulation: invalid_attributes }
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested simulation' do
      simulation = create(:simulation)
      expect do
        delete simulation_url(simulation)
      end.to change(Simulation, :count).by(-1)
    end

    it 'redirects to the simulations list' do
      simulation = create(:simulation)
      delete simulation_url(simulation)
      expect(response).to redirect_to(simulations_url)
    end
  end
end
